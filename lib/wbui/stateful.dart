import 'package:flutter/material.dart';

class Stateful extends StatelessWidget {
  final Widget child;
  Stateful({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(child: child);
  }
}
