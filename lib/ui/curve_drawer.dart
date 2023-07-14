import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

class CurveDrawer extends StatefulWidget {
  const CurveDrawer({
    super.key,
    required this.enabled,
    required this.indexKeys,
    required this.child,
  });

  final bool enabled;
  final List<GlobalKey> indexKeys;
  final Widget child;

  @override
  State<CurveDrawer> createState() => _CurveDrawerState();
}

class _CurveDrawerState extends State<CurveDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _canvasKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _animate());
  }

  Future<void> _animate() async {
    if (!widget.enabled) return;
    await Future.delayed(_cooldown);
    if (!mounted) return;
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CurveDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled && widget.enabled) {
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => CustomPaint(
        key: _canvasKey,
        painter: _ArrowPainter(
          widget.indexKeys,
          _canvasKey,
          _controller.value,
        ),
        child: child,
      ),
      child: widget.child,
    );
  }
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter(this.keys, this.painterKey, this.animationValue);

  final List<GlobalKey> keys;
  final GlobalKey painterKey;
  final double animationValue;

  @override
  void paint(Canvas canvas, Size size) {
    if (keys.isEmpty) return;
    if (keys.length == 1) return;
    if (animationValue == 0) return;

    final offset = painterKey.getWidgetInfo()?.offset;
    if (offset == null) return;

    for (int i = 0; i < keys.length - 1; i++) {
      final k1 = keys.elementAt(i).getWidgetInfo();
      final k2 = keys.elementAt(i + 1).getWidgetInfo();

      if (k1 == null || k2 == null) continue;

      final bottom = k1.offset.dx < k2.offset.dx
          ? (k1.size.bottomRight(Offset.zero), k2.size.topLeft(Offset.zero))
          : (k1.size.bottomLeft(Offset.zero), k2.size.topRight(Offset.zero));

      _drawCurve(
        canvas,
        k1.offset + bottom.$1 - offset,
        k2.offset + bottom.$2 - offset,
        size,
      );
    }
  }

  // TODO(rhbrunetto): apply chaching to improve performance
  void _drawCurve(Canvas canvas, Offset src, Offset dst, Size size) {
    final points = CatmullRomSpline(
      [
        src,
        Offset.lerp(src, (dst + Offset(0, dst.dy / 10)), 0.25) ?? dst,
        Offset.lerp(src, (dst - Offset(0, dst.dy / 10)), 0.75) ?? dst,
        dst,
      ],
      tension: 0.1,
    ).generateSamples(end: animationValue).map((e) => e.value).toList();

    canvas.drawPoints(PointMode.points, points, _paint);

    final end = points.last;
    final start = points.elementAt(points.length - 2);
    final dX = end.dx - start.dx;
    final dY = end.dy - start.dy;
    final angle = atan2(dY, dX);
    final arrow = Path()
      ..moveTo(
        end.dx - _arrowSize * cos(angle - _arrowAngle),
        end.dy - _arrowSize * sin(angle - _arrowAngle),
      )
      ..lineTo(end.dx, end.dy)
      ..lineTo(
        end.dx - _arrowSize * cos(angle + _arrowAngle),
        end.dy - _arrowSize * sin(angle + _arrowAngle),
      )
      ..close();

    canvas.drawPath(arrow, _paint);
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

final _paint = Paint()
  ..strokeCap = StrokeCap.square
  ..strokeJoin = StrokeJoin.round
  ..color = JobSiteColors.greyishBlue
  ..strokeWidth = 1;

const _cooldown = Duration(seconds: 2);
const _animationDuration = Duration(seconds: 2);
const _arrowSize = 10;
const _arrowAngle = 25 * pi / 180;

typedef WidgetInfo = ({Size size, Offset offset});

extension on GlobalKey {
  WidgetInfo? getWidgetInfo() {
    final renderBox = currentContext?.findRenderObject();
    if (renderBox is! RenderBox) return null;

    return (size: renderBox.size, offset: renderBox.localToGlobal(Offset.zero));
  }
}
