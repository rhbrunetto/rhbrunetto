import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';

typedef CustomBackgroundPainter = void Function(
  Canvas canvas,
  Size size,
  Offset keyOffset,
  Size keySize,
);

class BackgroundDrawer extends StatefulWidget {
  const BackgroundDrawer({
    super.key,
    required this.includeArrows,
    required this.indexKeys,
    this.customBackgrounds = const {},
    required this.child,
  });

  final bool includeArrows;
  final List<GlobalKey> indexKeys;
  final Map<GlobalKey, CustomBackgroundPainter> customBackgrounds;
  final Widget child;

  @override
  State<BackgroundDrawer> createState() => _BackgroundDrawerState();
}

class _BackgroundDrawerState extends State<BackgroundDrawer>
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
    if (!widget.includeArrows) return;
    await Future.delayed(_cooldown);
    if (!mounted) return;
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant BackgroundDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.includeArrows != widget.includeArrows &&
        widget.includeArrows) {
      _animate();
    }
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: CustomPaint(
          painter: _BackgroundPainter(
            customBackgrounds: widget.customBackgrounds,
          ),
          child: Builder(
            builder: (context) {
              if (!widget.includeArrows) {
                return widget.child;
              }

              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => CustomPaint(
                  key: _canvasKey,
                  painter: _ArrowPainter(
                    keys: widget.indexKeys,
                    painterKey: _canvasKey,
                    animationValue: _controller.value,
                  ),
                  child: child,
                ),
                child: widget.child,
              );
            },
          ),
        ),
      );
}

class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter({
    required this.customBackgrounds,
  });

  final Map<GlobalKey, CustomBackgroundPainter> customBackgrounds;

  @override
  void paint(Canvas canvas, Size size) {
    for (final entry in customBackgrounds.entries) {
      final info = entry.key.getWidgetInfo();
      if (info == null) return;

      entry.value(canvas, size, info.offset, info.size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ArrowPainter extends CustomPainter {
  _ArrowPainter({
    required this.keys,
    required this.painterKey,
    required this.animationValue,
  });

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
