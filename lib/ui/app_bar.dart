import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app/colors.dart';
import '../routes.gr.dart';

class RPAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RPAppBar({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  final List<RPAppBarButton> buttons;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _Logo(),
            _Menu(buttons: buttons),
            const _Contact(),
          ],
        ),
      );
}

class RPAppBarButton extends StatelessWidget {
  const RPAppBarButton({
    Key? key,
    required this.label,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => TextButton(
        style: _menuButtonStyle,
        onPressed: onTap,
        child: Text(label),
      );
}

class _Menu extends StatelessWidget {
  const _Menu({Key? key, required this.buttons}) : super(key: key);

  final List<RPAppBarButton> buttons;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Wrap(
          spacing: 24,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          children: buttons,
        ),
      );
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        hoverColor: Colors.transparent,
        onTap: () => context.router.navigate(const HomeRoute()),
        child: const Text.rich(
          TextSpan(
            text: 'rhbrunetto',
            children: [
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: RPColors.orangeHighlight,
                  fontSize: 42,
                ),
              )
            ],
          ),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      );
}

class _Contact extends StatelessWidget {
  const _Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: RPColors.dark,
          side: const BorderSide(width: 1, color: RPColors.dark),
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
        ),
        onPressed: () {},
        child: const Text(
          'Let\'s chat',
          style: TextStyle(
            color: RPColors.dark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

final _menuButtonStyle = TextButton.styleFrom(
  foregroundColor: RPColors.dark,
  textStyle: const TextStyle(
    fontSize: 15,
    color: RPColors.dark,
    fontWeight: FontWeight.bold,
  ),
);
