import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/layout_wrapper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/background_drawer.dart';
import '../../../../ui/paints/bubble.dart';
import '../section.dart';

@RoutePage()
class FirstSectionScreen extends StatelessWidget {
  const FirstSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (_) => GlobalKey());

    return LayoutWrapper(
      builder: (context, mode) => BackgroundDrawer(
        indexKeys: keys,
        includeArrows: mode == LayoutMode.web,
        customBackgrounds: {
          keys.elementAt(0): bubble,
        },
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
    );
  }
}
