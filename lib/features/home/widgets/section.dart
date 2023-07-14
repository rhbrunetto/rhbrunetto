import 'package:flutter/material.dart';

import '../../../core/layout_wrapper.dart';
import '../../../ui/colors.dart';

enum HomeSectionImageAlignment { left, right }

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.textKey,
    required this.text,
    required this.number,
    required this.image,
    this.imageAlignment = HomeSectionImageAlignment.right,
  });

  final GlobalKey textKey;
  final String text;
  final String number;
  final Widget image;
  final HomeSectionImageAlignment imageAlignment;

  @override
  Widget build(BuildContext context) => LayoutWrapper(
        builder: (context, mode) {
          if (mode == LayoutMode.web) {
            return _WebSection(
              textKey: textKey,
              text: text,
              number: number,
              image: image,
              imageAlignment: imageAlignment,
            );
          } else {
            return _MobileSection(
              textKey: textKey,
              text: text,
              number: number,
              image: image,
              imageAlignment: imageAlignment,
            );
          }
        },
      );
}

class _WebSection extends StatelessWidget {
  const _WebSection({
    required this.textKey,
    required this.text,
    required this.number,
    required this.image,
    required this.imageAlignment,
  });

  final GlobalKey textKey;
  final String text;
  final String number;
  final Widget image;
  final HomeSectionImageAlignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    final image = Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: this.image,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imageAlignment == HomeSectionImageAlignment.left) image,
            Text(
              key: textKey,
              number,
              style: const TextStyle(
                fontSize: 100,
                color: JobSiteColors.greyishBlue,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: JobSiteColors.greyishBlue,
              ),
            ),
            if (imageAlignment == HomeSectionImageAlignment.right) image,
          ],
        ),
      ),
    );
  }
}

class _MobileSection extends StatelessWidget {
  const _MobileSection({
    required this.textKey,
    required this.text,
    required this.number,
    required this.image,
    required this.imageAlignment,
  });

  final GlobalKey textKey;
  final String text;
  final String number;
  final Widget image;
  final HomeSectionImageAlignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: this.image,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Positioned.fill(
              bottom:
                  imageAlignment == HomeSectionImageAlignment.left ? 0 : null,
              top: imageAlignment == HomeSectionImageAlignment.left ? null : 0,
              child: image,
            ),
            Positioned(
              bottom:
                  imageAlignment == HomeSectionImageAlignment.left ? null : 0,
              top: imageAlignment == HomeSectionImageAlignment.left ? 0 : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    key: textKey,
                    number,
                    style: const TextStyle(
                      fontSize: 100,
                      color: JobSiteColors.greyishBlue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 24,
                      color: JobSiteColors.greyishBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}