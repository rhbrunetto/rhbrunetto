import 'package:flutter/material.dart';

class RPAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RPAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: preferredSize.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _Logo(),
            _Menu(),
            _Contact(),
          ],
        ),
      );
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Text('Ricardo');
}

class _Menu extends StatelessWidget {
  const _Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text('Home')),
            TextButton(onPressed: () {}, child: const Text('Projects')),
            TextButton(onPressed: () {}, child: const Text('Services')),
            TextButton(onPressed: () {}, child: const Text('Blog')),
          ],
        ),
      );
}

class _Contact extends StatelessWidget {
  const _Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: () {},
        child: const Text('Let\'s chat'),
      );
}
