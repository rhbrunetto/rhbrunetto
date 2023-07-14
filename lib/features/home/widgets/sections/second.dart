import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/layout_wrapper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../ui/curve_drawer.dart';
import '../section.dart';

@RoutePage()
class SecondSectionScreen extends StatelessWidget {
  const SecondSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (_) => GlobalKey());

    return LayoutWrapper(
      builder: (context, mode) => CurveDrawer(
        indexKeys: keys,
        enabled: mode == LayoutMode.web,
        child: ListView(
          shrinkWrap: true,
          children: [
            HomeSection(
              textKey: keys.elementAt(0),
              text: context.l10n.secondSectionFirstItem,
              number: '1.',
              image: Assets.images.undrawProfileDataReV81r.svg(),
            ),
            HomeSection(
              textKey: keys.elementAt(1),
              text: context.l10n.secondSectionSecondItem,
              number: '2.',
              image: Assets.images.undrawAboutMeWa29.svg(),
              imageAlignment: HomeSectionImageAlignment.left,
            ),
            HomeSection(
              textKey: keys.elementAt(2),
              text: context.l10n.secondSectionThirdItem,
              number: '3.',
              image: Assets.images.undrawSwipeProfiles1I6mr.svg(),
            ),
          ],
        ),
      ),
    );
  }
}
