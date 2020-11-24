import 'package:flutter/material.dart';

class WBHtmlView extends StatelessWidget {
  final String html;
  WBHtmlView({this.html, String isContent});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(html),
    );
  }
}
