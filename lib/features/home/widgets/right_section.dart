import 'package:flutter/material.dart';

import '../../../app/colors.dart';

class RightSection extends StatelessWidget {
  const RightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            color: RPColors.beigeBackground,
          ),
          const _Bubble(image: ' '),
        ],
      );
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) => const DecoratedBox(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          shadows: [
            BoxShadow(
              color: Color(0xff111111),
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.white,
          child: Icon(Icons.abc),
        ),
      );
}
