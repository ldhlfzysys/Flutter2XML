import 'package:flutter/material.dart';

class WBRecycleListView extends StatelessWidget {
  final Widget children;
  WBRecycleListView({this.children, String key, String count, String listId});
  @override
  Widget build(BuildContext context) {
    return Container(child: children);
  }
}

class WBRecyclerView extends StatelessWidget {
  final Widget child;
  WBRecyclerView(this.child, {String list, String length, String itemKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class WBTemplate extends StatelessWidget {
  final Widget child;
  WBTemplate(this.child);
  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}
