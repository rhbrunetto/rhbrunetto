import 'package:flutter/material.dart';

import 'common.dart';

abstract interface class Background {
  void paint(
    Canvas canvas,
    Size size,
    WidgetInfo canvasInfo,
    WidgetInfo keyInfo,
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

class _BackgroundPainterState extends State<BackgroundPainter> {
  final _canvasKey = GlobalKey();
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: CustomPaint(
          key: _canvasKey,
          painter: _BackgroundPainter(
            visible: _visible,
            painterKey: _canvasKey,
            backgroundMapper: widget.backgroundMapper,
          ),
          child: widget.child,
        ),
      );
}

class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter({
    required this.visible,
    required this.painterKey,
    required this.backgroundMapper,
  });

  final bool visible;
  final GlobalKey painterKey;
  final Map<GlobalKey, Background> backgroundMapper;

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) return;

    final canvasInfo = painterKey.getWidgetInfo();
    if (canvasInfo == null) return;

    for (final entry in backgroundMapper.entries) {
      final info = entry.key.getWidgetInfo();
      if (info == null) return;

      entry.value.paint(canvas, size, canvasInfo, info);
    }
  }

  @override
  bool shouldRepaint(covariant _BackgroundPainter oldDelegate) =>
      oldDelegate.visible != visible;
}

const _animationDuration = Duration(milliseconds: 300);
