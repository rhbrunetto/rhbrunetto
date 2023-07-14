import 'package:flutter/material.dart';

import '../../../core/layout_wrapper.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../ui/colors.dart';
import 'register_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) => LayoutWrapper(
        builder: (context, mode) {
          if (mode == LayoutMode.web) {
            return const _WebHeader();
          } else {
            return const _MobileHeader();
          }
        },
      );
}

class _MobileHeader extends StatelessWidget {
  const _MobileHeader();

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _HeaderBackgroundPainter(),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              context.l10n.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: JobSiteColors.greyishBlueDark,
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              children: [
                Assets.images.undrawAgreementAajr.svg(
                  fit: BoxFit.contain,
                  clipBehavior: Clip.none,
                  allowDrawingOutsideViewBox: true,
                ),
              ],
            )
          ],
        ),
      );
}

class _WebHeader extends StatelessWidget {
  const _WebHeader();

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _HeaderBackgroundPainter(),
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.title,
                    style: const TextStyle(
                      color: JobSiteColors.greyishBlueDark,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const RegisterButton(),
                  const SizedBox(height: 36),
                ],
              ),
              const SizedBox(width: 50),
              Flexible(
                child: ClipOval(
                  child: Container(
                    width: 300,
                    color: JobSiteColors.white,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Assets.images.undrawAgreementAajr
                          .svg(fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _HeaderBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.white);
    final width = size.width;
    final height = size.height;

    Path bezierPath = Path()
      ..lineTo(0, height)
      ..lineTo(width * 0.25, height)
      ..quadraticBezierTo(width * 0.75, height * 0.9, width, height * 0.91)
      ..lineTo(width, 0);

    final bezierPaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          JobSiteColors.greyishBlueLightest,
          JobSiteColors.turquoiseLightest,
        ],
      ).createShader(Offset.zero & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
