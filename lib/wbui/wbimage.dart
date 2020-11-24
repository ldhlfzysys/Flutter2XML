import 'package:flutter/material.dart';

class WBImage extends StatelessWidget {
  final Size size;
  WBImage({
    String url,
    this.size,
    String iconName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
    );
  }
}
