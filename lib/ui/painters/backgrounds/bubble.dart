import 'package:flutter/material.dart';

import '../../colors.dart';
import '../background_painter.dart';
import '../common.dart';

class BubbleBackground implements Background {
  const BubbleBackground({
    required this.radius,
    this.offset = FractionalOffset.center,
  });

  final double radius;
  final FractionalOffset offset;

  @override
  void paint(
    Canvas canvas,
    Size size,
    WidgetInfo canvasInfo,
    WidgetInfo keyInfo,
    double value,
  ) {
    canvas.drawCircle(
      offset.alongSize(keyInfo.size) + keyInfo.offset - canvasInfo.offset,
      // keyInfo.size.bottomCenter(keyInfo.offset) - canvasInfo.offset,
      radius * value,
      _paint,
    );
  }
}

final _paint = Paint()..color = JobSiteColors.greyLight;
