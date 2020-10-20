import 'package:flutter/material.dart';

import 'wblistview.dart';

Widget exportCard1() {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('title'),
      ),
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                  child: TabBar(
                tabs: [
                  Tab(text: 'tab1'),
                  Tab(
                    text: 'tab2',
                  ),
                  Tab(
                    text: 'tab3',
                  ),
                ],
                labelColor: Color.fromRGBO(51, 51, 51, 1),
                unselectedLabelColor: Color.fromRGBO(147, 147, 147, 1),
              )),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  child: Center(
                    child: Text('tab1'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('tab2'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('tab3'),
                  ),
                )
              ]))
            ],
          )));
}
