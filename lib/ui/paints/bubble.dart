import 'package:flutter/material.dart';

void bubble(Canvas canvas, Size size, Offset keyOffset, Size keySize) {
  canvas.drawLine(Offset.zero, keyOffset, _paint);
}

final _paint = Paint()
  ..color = Colors.red
  ..strokeWidth = 10;
