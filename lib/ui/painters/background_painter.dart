import 'package:flutter/material.dart';

import 'common.dart';

abstract interface class Background {
  void paint(
    Canvas canvas,
    Size size,
    WidgetInfo canvasInfo,
    WidgetInfo keyInfo,
    double animationValue,
  );
}

class BackgroundPainter extends StatefulWidget {
  const BackgroundPainter({
    super.key,
    this.backgroundMapper = const {},
    required this.child,
  });

  final Map<GlobalKey, Background> backgroundMapper;
  final Widget child;

  @override
  State<BackgroundPainter> createState() => _BackgroundPainterState();
}

class _BackgroundPainterState extends State<BackgroundPainter>
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
    await Future.delayed(_cooldown);
    if (!mounted) return;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            key: _canvasKey,
            painter: _BackgroundPainter(
              value: _controller.value,
              painterKey: _canvasKey,
              backgroundMapper: widget.backgroundMapper,
            ),
            child: child,
          ),
          child: widget.child,
        ),
      );
}

class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter({
    required this.value,
    required this.painterKey,
    required this.backgroundMapper,
  });

  final double value;
  final GlobalKey painterKey;
  final Map<GlobalKey, Background> backgroundMapper;

  @override
  void paint(Canvas canvas, Size size) {
    if (value == 0) return;

    final canvasInfo = painterKey.getWidgetInfo();
    if (canvasInfo == null) return;

    for (final entry in backgroundMapper.entries) {
      final info = entry.key.getWidgetInfo();
      if (info == null) return;

      entry.value.paint(canvas, size, canvasInfo, info, value);
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) =>
      oldDelegate.value != value;
}

const _cooldown = Duration(milliseconds: 300);
const _animationDuration = Duration(milliseconds: 500);
