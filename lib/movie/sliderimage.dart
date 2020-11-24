import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget exportCard2() {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('点评讨论'),
      ),
      body: Container(
          height: 80,
          child: SingleChildScrollView(
            //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
            scrollDirection: Axis.horizontal,
            //true 滑动到底部
            reverse: false,
            padding: EdgeInsets.all(0.0),
            //滑动到底部回弹效果
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.pink,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.green,
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ),
          )));
}
