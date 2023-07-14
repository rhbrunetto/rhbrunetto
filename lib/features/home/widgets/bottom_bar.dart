import 'package:flutter/material.dart';

import '../../../core/layout_wrapper.dart';
import '../../../ui/colors.dart';
import 'register_button.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) => LayoutWrapper(
        builder: (context, mode) {
          if (mode == LayoutMode.web) {
            return const SizedBox.shrink();
          } else {
            return const _MobileBottomBar();
          }
        },
      );
}

class _MobileBottomBar extends StatelessWidget {
  const _MobileBottomBar();

  @override
  Widget build(BuildContext context) => const Material(
        color: JobSiteColors.white,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: RegisterButton(),
        ),
      );
}
