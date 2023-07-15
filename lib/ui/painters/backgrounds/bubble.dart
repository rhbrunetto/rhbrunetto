import 'package:flutter/material.dart';

import '../../colors.dart';


void bubble(
  Canvas canvas,
  Size size,
  Offset canvasOffset,
  Offset keyOffset,
  Size keySize,
) {
  final width = size.width;

  // final top = (keyOffset & keySize).topCenter - _deltaOffset;
  // final bottom = (keyOffset & keySize).bottomCenter + _deltaOffset;

  final top = keyOffset - canvasOffset;
  final bottom = keyOffset = canvasOffset;

  print(top);
  print(bottom);

  Path bezierPath = Path()
    ..moveTo(0, top.dy)
    ..lineTo(width, top.dy)
    ..moveTo(width, bottom.dy)
    ..lineTo(0, bottom.dy)
    ..close();

  final bezierPaint = Paint()
    ..shader = const LinearGradient(
      colors: [
        JobSiteColors.greyishBlueLightest,
        JobSiteColors.turquoiseLightest,
      ],
    ).createShader(Offset.zero & size);

  // canvas.drawRect(keyOffset & keySize , _paint);

  canvas.drawPath(bezierPath, _paint);
}

const _totalHeight = 200.0;
const _deltaOffset = Offset(0, _totalHeight / 2);
final _paint = Paint()
  ..color = Colors.red
  ..strokeWidth = 10;
