import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/layout_wrapper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/painters/background_painter.dart';
import '../../../../ui/painters/backgrounds/bubble.dart';
import '../../../../ui/painters/backgrounds/wave.dart';
import '../../../../ui/painters/curves_painter.dart';
import '../section.dart';

@RoutePage()
class FirstSectionScreen extends StatelessWidget {
  const FirstSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (_) => GlobalKey());

    return LayoutWrapper(
      builder: (context, mode) => BackgroundPainter(
        backgroundMapper: {
          keys.elementAt(0): const BubbleBackground(radius: 60),
          keys.elementAt(1): const WaveBackground(),
          keys.elementAt(2): const BubbleBackground(
            radius: 80,
            offset: FractionalOffset.bottomCenter,
          ),
        },
        child: CurvesPainter(
          indexKeys: keys,
          enabled: mode == LayoutMode.web,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              HomeSection(
                textKey: keys.elementAt(0),
                text: context.l10n.firstSectionFirstItem,
                number: '1.',
                image: Assets.images.undrawProfileDataReV81r.svg(),
              ),
              HomeSection(
                textKey: keys.elementAt(1),
                text: context.l10n.firstSectionSecondItem,
                number: '2.',
                image: Assets.images.undrawTask31wc.svg(),
                imageAlignment: HomeSectionImageAlignment.left,
              ),
              HomeSection(
                textKey: keys.elementAt(2),
                text: context.l10n.firstSectionThirdItem,
                number: '3.',
                image: Assets.images.undrawPersonalFile222m.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
