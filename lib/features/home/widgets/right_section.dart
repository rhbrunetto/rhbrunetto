import 'package:flutter/material.dart';

import '../../../app/colors.dart';
import '../../../gen/assets.gen.dart';
import 'icons_panel.dart';

class RightSection extends StatelessWidget {
  const RightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: RPColors.beigeBackground,
        child: Column(
          children: const [
            SizedBox(height: 48),
            _Header(),
            SizedBox(height: 24),
            _Content(),
          ],
        ),
      );
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: const [
            _Image(),
            IconsPanel(),
          ],
        ),
      );
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned.fill(
        bottom: 0,
        child: Assets.images.ricardo.image(fit: BoxFit.contain),
      );
}

// TODO(rhbrunetto): think in a better text
class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Text.rich(
        TextSpan(
          text: 'Your ',
          children: [
            TextSpan(
              text: 'mobile',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' application'),
            TextSpan(text: '\nfrom scratch or maintained'),
          ],
        ),
        style: TextStyle(fontSize: 24, height: 1.3),
      );
}
