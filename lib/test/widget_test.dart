import 'package:dart2xml/test/wblistview.dart';
import 'package:dart2xml/wb_tabindicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget exportCard1() {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('点评讨论'),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(right: 40),
                  // width: 320,
                  child: TabBar(
                    indicator: WBTabIndicator(
                        color: Colors.yellow,
                        count: 2,
                        sliderWidth: 30,
                        edgeInsets: EdgeInsets.only(left: -55)),
                    labelStyle: TextStyle(
                      fontSize: 22,
                    ),
                    onTap: (value) {
                      return 'mytap(value.mid)';
                    },
                    unselectedLabelStyle: TextStyle(fontSize: 16),
                    tabs: [
                      Tab(
                          child: Container(
                        height: 48,
                        margin: EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Text('点评'),
                            Text(
                              ' (1234条)',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      )),
                      Tab(
                        child: Container(
                            height: 48,
                            margin: EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Text('讨论'),
                                Text(
                                  ' (1234条)',
                                  style: TextStyle(fontSize: 13),
                                )
                              ],
                            )),
                      ),
                    ],
                    labelColor: Color.fromRGBO(51, 51, 51, 1),
                    unselectedLabelColor: Color.fromRGBO(147, 147, 147, 1),
                  )),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  color: Colors.blue,
                ),
                Container(color: Colors.yellow)
              ]))
            ],
          )));
}
