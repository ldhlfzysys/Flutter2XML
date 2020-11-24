import 'package:dart2xml/wbui/wbimage.dart';
import 'package:flutter/material.dart';

Widget video() {
  return Container(
    height: 200,
    margin: EdgeInsets.only(left: 12, right: 12, bottom: 10),
    child: WBImage(
      url: "this.videoImg",
      size: Size(320, 200),
    ),
  );
}
