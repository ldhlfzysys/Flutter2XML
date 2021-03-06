import 'package:dart2xml/movie/detailCmt.dart';
import 'package:dart2xml/wbui/wb_colors.dart';
import 'package:flutter/material.dart';

void main(List<String> arguments) {
  runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: WBColors().skinColor(WBColorKey.CommonBackground),
        splashColor: Color.fromRGBO(0, 0, 0, 0),
        highlightColor: Color.fromRGBO(0, 0, 0, 0),
        buttonTheme: new ButtonThemeData(
            minWidth: 0,
            height: 0,
            padding: EdgeInsets.all(0),
            buttonColor: Colors.transparent)),
    home: mymovie(),
    builder: (context, widget) {
      return MediaQuery(
        //设置文字大小不随系统设置改变
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: widget,
      );
    },
  ));
}
