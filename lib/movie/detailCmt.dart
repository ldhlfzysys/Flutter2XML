import 'package:dart2xml/movie/flutterfeed.dart';
import 'package:dart2xml/wbui/stateful.dart';
import 'package:dart2xml/wbui/wbrecyclelistview.dart';
import 'package:dart2xml/wbui/wbtabindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget mymovie() {
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
                child: Stateful(
                  child: TabBar(
                      indicator: WBTabIndicator(
                          count: 2,
                          sliderWidth: 30,
                          color: Colors.yellow,
                          edgeInsets: EdgeInsets.only(left: 45)),
                      labelStyle:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      tabs: [
                        Tab(
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Text("大V点评"),
                                Text(
                                  "(xx条)",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 48,
                            margin: EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Text("评论"),
                                Text(
                                  "(xx条)",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    child: WBRecycleListView(
                      key: "id",
                      count: "this.curFeed.length",
                      listId: "1",
                      children: WBRecyclerView(WBTemplate(feed()),
                          list: "this.curComment",
                          length: "40",
                          itemKey: "key"),
                    ),
                  ),
                  Container(
                    child: WBRecycleListView(
                      key: "id",
                      count: "this.curFeed.length",
                      listId: "1",
                      children: WBRecyclerView(WBTemplate(feed()),
                          list: "this.curComment",
                          length: "40",
                          itemKey: "key"),
                    ),
                  )
                ]),
              )
            ],
          )));
}
