import 'package:dart2xml/wbui/wbimage.dart';
import 'package:flutter/material.dart';

Widget pics() {
  return Container(
    height: 120,
    margin: EdgeInsets.only(left: 12, bottom: 10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(right: 4),
              child: WBImage(
                url: "this.picInfo.url",
                size: Size(120, 120),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
