import 'package:analyzer/dart/ast/ast.dart';

Map nodes = {};
BaseNode root;

//接受外部的遍历，进行分发
void disaptchAstNode(AstNode node) {
  if (node.runtimeType.toString() == 'MethodInvocationImpl') {
    createMethodInvocationImpl(node);
  } else if (node.runtimeType.toString() == 'NamedExpressionImpl') {
    createNamedExpressionImpl(node);
  } else if (node.runtimeType.toString() == 'ListLiteralImpl') {
    createListLiteralImpl(node);
  } else if (node.runtimeType.toString() == 'IntegerLiteralImpl') {
    createIntegerLiteralImpl(node);
  } else if (node.runtimeType.toString() == 'DoubleLiteralImpl') {
    createDoubleLiteralImpl(node);
  } else if (node.runtimeType.toString() == 'SimpleStringLiteralImpl') {
    createSimpleStringLiteralImpl(node);
  } else if (node.runtimeType.toString() == 'PrefixedIdentifierImpl') {
    createPrefixedIdentifierImpl(node);
  }
}

//根据hashCode关系，一路找到父节点，理论上除了根节点，一定能找到
BaseNode findParentNode(AstNode node) {
  if (node == null) {
    return null;
  }
  if (node.parent != null && nodes.containsKey(node.parent.hashCode)) {
    return nodes[node.parent.hashCode];
  } else {
    return findParentNode(node.parent);
  }
}

//处理MethodInvocationImpl
void createMethodInvocationImpl(AstNode node) {
  //构造标签，识别是普通单个标签，还是构造函数标签。
  MethodInvocationNode mnode = MethodInvocationNode(node);
  if (root == null) {
    root = mnode;
  }
  List childs = node.childEntities.toList();
  for (var i = 0; i < childs.length; i++) {
    //第一个为标签名
    if (i == 0 && childs[i].runtimeType.toString() == 'SimpleIdentifierImpl') {
      SimpleIdentifier s = childs[i];
      mnode.xmlName = s.name;
    }
    //第二个也是说明是构造函数，类似BorderRadius.all这种类型
    if (i == 2 && childs[i].runtimeType.toString() == 'SimpleIdentifierImpl') {
      SimpleIdentifier s = childs[i];
      mnode.xmlName += '.' + s.name;
    }
  }
  if (mnode.parent != null && mnode.parent is NamedExpressionNode) {
    //有父，并且父为NamedExpressionNode
    NamedExpressionNode p = mnode.parent;
    p.value = mnode;
    //继续往上构建
    MethodInvocationNode superp = p.parent;
    superp.attrChildren[p.key] = p.value;
    //兼容vue语法
    addvfor(mnode, superp);
  } else if (mnode.parent != null && mnode.parent is ListLiteralNode) {
    ListLiteralNode p = mnode.parent;
    p.children.add(mnode);
  } else if (mnode.parent != null && mnode.parent is MethodInvocationNode) {
    MethodInvocationNode p = mnode.parent;
    p.args.add(mnode);
  }
}

void addvfor(MethodInvocationNode node, MethodInvocationNode parent) {
  if (parent.xmlName == 'WBListView') {
    String dataName = parent.attrs[':data'];
    node.attrs['v-for'] = '(item,index) in ' + dataName + '';
    String id = parent.attrs[':key'];
    node.attrs['v-bind:key'] = 'item.' + id;
  }
}

//处理NamedExpressionImpl，
void createNamedExpressionImpl(AstNode node) {
  //构造属性，遍历属性名和属性值，设置给父节点，根据类型设置
  NamedExpressionNode nnode = NamedExpressionNode(node);
  List childs = node.childEntities.toList();
  for (var i = 0; i < childs.length; i++) {
    //第一个为属性名
    if (i == 0 && childs[i].runtimeType.toString() == 'LabelImpl') {
      AstNode s = childs[i];
      SimpleIdentifier attrs = s.childEntities.toList()[0];
      nnode.key = attrs.name;
    }
  }
}

void createIntegerLiteralImpl(AstNode node) {
  IntegerLiteral realNode = node;
  BaseNode parent = findParentNode(node);
  if (parent is NamedExpressionNode) {
    MethodInvocationNode superp = parent.parent;
    superp.attrs[parent.key] = realNode.value;
  }
  if (parent is MethodInvocationNode) {
    parent.wbargs.add(realNode.value);
  }
}

void createDoubleLiteralImpl(AstNode node) {
  DoubleLiteral realNode = node;
  BaseNode parent = findParentNode(node);
  if (parent is NamedExpressionNode) {
    MethodInvocationNode superp = parent.parent;
    superp.attrs[parent.key] = realNode.value;
  }
  if (parent is MethodInvocationNode) {
    parent.wbargs.add(realNode.value.toDouble());
  }
}

void vdataparse(MethodInvocationNode node, String key, String value) {
  if (value.startsWith('this.')) {
    key = ':' + key;
    value = value.replaceFirst('this.', '');
  }
  node.attrs[key] = value;
}

//vue data标注
void vdata(MethodInvocationNode node) {
  if (node.xmlName == 'WBListView') {
    changeKeyName(node.attrs, 'data');
    changeKeyName(node.attrs, 'key');
  } else if (node.xmlName == 'WBImage') {
    changeKeyName(node.attrs, 'url');
  } else if (node.xmlName == 'WBRecyclerView') {
    changeKeyName(node.attrs, 'list');
  }
}

void changeKeyName(Map maps, String key) {
  if (maps.containsKey(key)) {
    maps[':' + key] = maps[key];
    maps.remove(key);
  }
}

void createSimpleStringLiteralImpl(AstNode node) {
  SimpleStringLiteral realNode = node;
  BaseNode parent = findParentNode(node);
  if (parent is NamedExpressionNode) {
    MethodInvocationNode superp = parent.parent;
    vdataparse(superp, parent.key, realNode.value);
    // superp.attrs[parent.key] = realNode.value;
    // vdata(superp);
  }
  if (parent is MethodInvocationNode) {
    parent.wbargs.add(realNode.value);
  }
}

void createPrefixedIdentifierImpl(AstNode node) {
  PrefixedIdentifierNode pnode = PrefixedIdentifierNode(node);
  PrefixedIdentifier realNode = node;
  pnode.name = realNode.name;
  BaseNode parent = findParentNode(node);
  if (parent is NamedExpressionNode) {
    MethodInvocationNode superp = parent.parent;
    superp.attrChildren[parent.key] = pnode;
  }
}

void createListLiteralImpl(AstNode node) {
  ListLiteralNode lnode = ListLiteralNode(node);
  BaseNode parent = findParentNode(node);
  if (parent is NamedExpressionNode) {
    MethodInvocationNode superp = parent.parent;
    superp.attrChildren[parent.key] = lnode;
  }
}

//解析BaseNode产生xml
String outputXML(BaseNode node) {
  String outputString = '';
  if (node is MethodInvocationNode) {
    //step1 拼接标签头
    String xmlName = node.xmlName.replaceAll('.', ':');
    if (xmlName == 'WBTemplate') {
      xmlName = 'template';
    }
    outputString += '<' + xmlName;
    //step2 先看有没有attrs属性，需要拼到标签头
    node.attrs.forEach((key, value) {
      if (value is int) {
        value = value.toString();
      }
      //处理手势类，如果带了=号，认为值包含了属性部分
      if (['onTap', 'onLongPress', 'onDoubleTap'].contains(key)) {
        key = '@' + key;
      }
      outputString += ' ' + key + '="' + value.toString() + '"';
    });
    //vue语法兼容
    //vue语法兼容
    // if (node.parent is MethodInvocationNode) {
    //   MethodInvocationNode parent = node.parent;
    //   if (parent.xmlName == 'WBListView') {
    //     String dataName = parent.attrs['data'];
    //     outputString += ' ' + 'v-for="(item,index) in "' + dataName;
    //   }
    // }
    //step3 拼接后缀
    outputString += '>';

    //wbargs处理
    if (node.wbargs.length > 0) {
      outputString += '<args>';
    }
    node.wbargs.forEach((element) {
      if (element is String) {
        outputString += '<string>' + element + '</string>';
      } else if (element is int) {
        outputString += '<int>' + element.toString() + '</int>';
      } else if (element is bool) {
        outputString += '<bool>' + (element ? 'true' : 'false') + '</bool>';
      } else if (element is double) {
        outputString += '<double>' + element.toString() + '</double>';
      }
    });
    if (node.wbargs.length > 0) {
      outputString += '</args>';
    }

    //args处理
    node.args.forEach((element) {
      outputString += outputXML(element);
    });

    //step4 拼接attrChildren
    node.attrChildren.forEach((key, value) {
      outputString += '<' + xmlName + '.' + key + '>';
      String rescurXml = outputXML(value);
      outputString += rescurXml;
      outputString += '</' + xmlName + '.' + key + '>';
    });

    outputString += '</' + xmlName + '>';

    return outputString;
  }
  if (node is ListLiteralNode) {
    node.children.forEach((element) {
      String rescurXml = outputXML(element);
      outputString += rescurXml;
    });
    return outputString;
  }
  if (node is PrefixedIdentifierNode) {
    outputString += '<' + node.name.replaceAll('.', ':') + '/>';
    return outputString;
  }
}

class BaseNode {
  int hashCodeId;
  BaseNode parent;
  BaseNode(AstNode node) {
    this.hashCodeId = node.hashCode;
    this.parent = findParentNode(node);
    nodes[this.hashCodeId] = this;
  }
}

class NamedExpressionNode extends BaseNode {
  String key;
  dynamic value; //可能是MethodInvocationNode，也可能是普通的值
  NamedExpressionNode(AstNode node) : super(node);
}

class ListLiteralNode extends BaseNode {
  List children;
  ListLiteralNode(AstNode node) : super(node) {
    children = [];
  }
}

class PrefixedIdentifierNode extends BaseNode {
  String name;
  PrefixedIdentifierNode(AstNode node) : super(node);
}

class MethodInvocationNode extends BaseNode {
  String xmlName;
  Map<String, dynamic> attrs; //width:100
  Map attrChildren; //color:Colors.red
  List args; //Text('a')
  List wbargs; //我们特定的语法
  Map temps;
  MethodInvocationNode(AstNode node) : super(node) {
    attrs = {};
    attrChildren = {};
    args = [];
    wbargs = [];
    temps = {};
  }
}
