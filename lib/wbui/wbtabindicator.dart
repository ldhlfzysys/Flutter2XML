import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WBTabIndicator extends Decoration {
  final BoxPainter _painter;

  //构造函数前初始化实例变量
  WBTabIndicator(
      {@required Color color,
      @required int count,
      double sliderWidth = 20,
      EdgeInsets edgeInsets = const EdgeInsets.all(0.0),
      List<EdgeInsets> insets})
      : _painter =
            _CirclePainter(color, count, sliderWidth, edgeInsets, insets);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final int count;
  final double sliderWidth;
  final EdgeInsets edgeInsets;
  final List<EdgeInsets> insets;

  _CirclePainter(
      Color color, this.count, this.sliderWidth, this.edgeInsets, this.insets)
      : _paint = Paint()
          ..color = color
          ..strokeWidth = 3
          ..shader = ui.Gradient.linear(
              Offset(0, 0),
              Offset((80 * count).toDouble(), 0),
              [
                Color(0xFFFE9600),
                Color(0xFFFE7E00),
                Color(0xFFFF6800),
                Color(0xFFFF5100),
                Color(0xFFFF3900)
              ],
              [0, 0.2, 0.4, 0.6, 0.8],
              TileMode.clamp)
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    //一个按钮宽度
    double oneWidth = cfg.size.width;

    //相对变化的区间。从0-1-2
    double relativeOffset = offset.dx / oneWidth;

    //左边index,值为0，1，2
    int leftIndex = relativeOffset.floor();

    //右边index.值为1,2,3
    int rightnIndex = min(leftIndex + 1, count - 1);

    //空白位置
    double spaceWidth = (oneWidth - sliderWidth) / 2;

    //左边起始点
    double originLeft = spaceWidth + (oneWidth * leftIndex);

    //右边起始点
    double originRight = spaceWidth + sliderWidth + (oneWidth * rightnIndex);

    //位移
    originLeft = originLeft;
    originRight = originRight;

    double changeRate = relativeOffset % 1;
    //变化的长度
    double changeWidth = changeRate * oneWidth * 2;
    double changeWidthRight = (1 - changeRate) * oneWidth * 2;

    //位置
    double slider_position = 33;
    double slider_height = 3;
    //当前滑动否过半
    double leftOffset = 0;
    double rightOffset = 0;
    if (insets != null && insets.length == count) {
      leftOffset = insets[leftIndex].left;
      rightOffset = insets[rightnIndex].left;
    } else {
      leftOffset = rightOffset = edgeInsets.left;
    }
    //55 40

    if (changeRate < 0.5) {
      double roffset = (rightOffset - leftOffset) * changeRate * 2;
      //未过半，左边固定，右边不断增长
      Rect rect = Rect.fromLTRB(
          originLeft - leftOffset,
          slider_position,
          originLeft + sliderWidth + changeWidth - leftOffset - roffset,
          slider_position + slider_height);
      RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(2.0));
      canvas.drawRRect(rRect, _paint);
    } else {
      double realRate = 1 - changeRate;
      if (changeRate == 1) {
        realRate = 0;
      }
      double roffset = (rightOffset - leftOffset) * realRate * 2;
      Rect rect = Rect.fromLTRB(
          originRight - changeWidthRight - sliderWidth - rightOffset + roffset,
          slider_position,
          originRight - rightOffset,
          slider_position + slider_height);
      RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(2.0));
      canvas.drawRRect(rRect, _paint);
    }
  }
}
