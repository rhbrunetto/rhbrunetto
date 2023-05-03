import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/colors.dart';
import '../../../routes.gr.dart';

class LeftSection extends StatelessWidget {
  const LeftSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Name(),
              _Buttons(),
              _Stats(),
            ],
          ),
        ),
        bottomNavigationBar: const _Footer(),
      );
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        heightFactor: .3,
        child: Container(
          color: RPColors.dark,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'From dApps to your company internal solution',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.navigateTo(const AboutRoute()),
                      style: TextButton.styleFrom(
                        elevation: 0,
                        backgroundColor: RPColors.yellowHighlight,
                        foregroundColor: RPColors.dark,
                        fixedSize: const Size(100, 50),
                      ),
                      child: const Text('Know More'),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    _FooterItem(
                      label: 'International experience',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

class _Stats extends StatelessWidget {
  const _Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _StatItem(
            title: '+10',
            subtitle: 'Clients on work worldwide',
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              width: constraints.maxWidth,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  const _StatItem(
                    title: '30',
                    subtitle: 'Projects Done',
                  ),
                  _StatItem(
                    title: 'Contact',
                    subtitle: 'ricardo@rhbrunetto.com',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO(rhbrunetto): improve this. Really trash.
            const Text(
              'Developing user interfaces for over 4 years as a mobile developer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    elevation: 0,
                    backgroundColor: RPColors.orangeHighlight,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(100, 50),
                  ),
                  child: const Text('Hire Me'),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    iconColor: RPColors.dark,
                    foregroundColor: RPColors.dark,
                    fixedSize: const Size(100, 50),
                  ),
                  icon: const Icon(Icons.open_in_new_sharp, size: 16),
                  onPressed: () => context.navigateTo(const ProjectsRoute()),
                  label: const Text('Projects'),
                ),
              ],
            )
          ],
        ),
      );
}

// TODO(rhbrunetto): refactor to a RenderObject to ensure chip is centered
class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FittedBox(
        child: Text.rich(
          TextSpan(
            text: 'Hi! I Am',
            children: [
              WidgetSpan(child: SizedBox(width: 48)),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Chip(
                  padding: EdgeInsets.all(16),
                  backgroundColor: RPColors.purpleHighlight,
                  label: Text(
                    'Mobile Dev',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextSpan(text: '\nRicardo Brunetto')
            ],
          ),
          style: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(subtitle, style: const TextStyle(fontSize: 16)),
          ],
        ),
      );
}

class _FooterItem extends StatelessWidget {
  const _FooterItem({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) => Text(
        '\u00B7 $label',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      );
}
