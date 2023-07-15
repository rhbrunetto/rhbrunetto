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
class SecondSectionScreen extends StatelessWidget {
  const SecondSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (_) => GlobalKey());

    return LayoutWrapper(
      builder: (context, mode) => BackgroundPainter(
        backgroundMapper: {
          keys.elementAt(1): WaveBackground(wide: mode == LayoutMode.web),
          keys.elementAt(2): const BubbleBackground(
            radius: 100,
            offset: FractionalOffset.topCenter,
          ),
        },
        child: CurvesPainter(
          indexKeys: keys,
          enabled: mode == LayoutMode.web,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeSection(
                textKey: keys.elementAt(0),
                text: context.l10n.secondSectionFirstItem,
                number: '1.',
                image: Assets.images.undrawProfileDataReV81r.svg(),
                webAlignment: WebSectionAlignment.left,
                mobileAlignment: MobileSectionAlignment.top,
              ),
              HomeSection(
                textKey: keys.elementAt(1),
                text: context.l10n.secondSectionSecondItem,
                number: '2.',
                image: Assets.images.undrawAboutMeWa29.svg(),
              ),
              HomeSection(
                textKey: keys.elementAt(2),
                text: context.l10n.secondSectionThirdItem,
                number: '3.',
                image: Assets.images.undrawSwipeProfiles1I6mr.svg(),
                webAlignment: WebSectionAlignment.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
