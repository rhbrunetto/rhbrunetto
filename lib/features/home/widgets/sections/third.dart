import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/layout_wrapper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/painters/background_painter.dart';
import '../../../../ui/painters/backgrounds/wave.dart';
import '../../../../ui/painters/curves_painter.dart';
import '../section.dart';

@RoutePage()
class ThirdSectionScreen extends StatelessWidget {
  const ThirdSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (_) => GlobalKey());

    return LayoutWrapper(
      builder: (context, mode) => BackgroundPainter(
        backgroundMapper: {
          keys.elementAt(1): const WaveBackground(),
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
                text: context.l10n.thirdSectionFirstItem,
                number: '1.',
                image: Assets.images.undrawProfileDataReV81r.svg(),
              ),
              HomeSection(
                textKey: keys.elementAt(1),
                text: context.l10n.thirdSectionSecondItem,
                number: '2.',
                image: Assets.images.undrawJobOffersKw5d.svg(),
                imageAlignment: HomeSectionImageAlignment.left,
              ),
              HomeSection(
                textKey: keys.elementAt(2),
                text: context.l10n.thirdSectionThirdItem,
                number: '3.',
                image: Assets.images.undrawBusinessDealCpi9.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
