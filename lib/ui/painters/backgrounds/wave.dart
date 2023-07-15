import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../background_painter.dart';
import '../common.dart';

class WaveBackground implements Background {
  const WaveBackground();

  @override
  void paint(
    Canvas canvas,
    Size size,
    WidgetInfo canvasInfo,
    WidgetInfo keyInfo,
    double value,
  ) {
    final width = size.width;
    final top = Offset(0, keyInfo.offset.dy - _totalHeight / 2)
        .let((it) => it - canvasInfo.offset);
    final bottom = Offset(width, keyInfo.offset.dy + _totalHeight)
        .let((it) => it - canvasInfo.offset);

    // Control points for bezier
    final h1 = Offset(width * 0.2, top.dy + (top.dy / 8));
    final h2 = Offset(width * 0.8, top.dy);
    final h3 = Offset(width * 0.8, bottom.dy);
    final h4 = Offset(width * 0.2, bottom.dy - (bottom.dy / 10));
    final epsylon = width / 8;

    Path bezierPath = Path()
      ..moveTo(0, top.dy)
      ..quadraticBezierTo(h1.dx, h1.dy, h2.dx, h2.dy)
      ..quadraticBezierTo(h2.dx + epsylon, h2.dy, width, top.dy * 1.2)
      ..lineTo(width, bottom.dy * 0.8)
      ..quadraticBezierTo(h3.dx, h3.dy, h4.dx, h4.dy)
      ..quadraticBezierTo(h4.dx - epsylon, h4.dy, 0, bottom.dy * 0.9)
      ..close();

    final bezierPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          JobSiteColors.turquoiseLightest.withOpacity(value),
          JobSiteColors.greyishBlueLightest.withOpacity(value),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }
}

const _totalHeight = 190.0;
