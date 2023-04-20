import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

final _icons = [
  Assets.icons.android,
  Assets.icons.dart,
  Assets.icons.flutter,
  Assets.icons.ios,
];

const _iconSize = 36.0;

class IconsPanel extends StatefulWidget {
  const IconsPanel({Key? key}) : super(key: key);

  @override
  State<IconsPanel> createState() => _IconsPanelState();
}

class _IconsPanelState extends State<IconsPanel> {
  @override
  Widget build(BuildContext context) {
    final length = max(1, _icons.length - 1);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: _icons
            .mapIndexed(
              (i, icon) => Align(
                alignment: Alignment(
                  i.isEven ? -1 : 1,
                  ((2 / length) * i) - 1,
                ),
                child: _Bubble(image: icon),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
    required this.image,
  }) : super(key: key);

  final SvgGenImage image;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          shadows: [
            BoxShadow(
              color: Color(0x38111111),
              blurRadius: 16,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: CircleAvatar(
          radius: _iconSize,
          backgroundColor: Colors.white,
          child: image.svg(),
        ),
      );
}
