import 'package:flutter/material.dart';

typedef WidgetInfo = ({Size size, Offset offset});

extension WidgetInfoExt on GlobalKey {
  WidgetInfo? getWidgetInfo() {
    final renderBox = currentContext?.findRenderObject();
    if (renderBox is! RenderBox) return null;

    return (size: renderBox.size, offset: renderBox.localToGlobal(Offset.zero));
  }
}
