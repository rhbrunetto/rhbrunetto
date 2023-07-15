import 'package:flutter/material.dart';
import 'package:dfunc/dfunc.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../ui/app_bar.dart';
import '../../../ui/colors.dart';
import 'register_button.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _HeaderBackgroundPainter(1.0),
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

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
        pinned: true,
        delegate: _Delegate(
          title: context.l10n.title,
        ),
      );
}

class _Delegate extends SliverPersistentHeaderDelegate {
  const _Delegate({
    required this.title,
  });

  final String title;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final maxWidth = MediaQuery.of(context).size.width;
    final ratio = (shrinkOffset / maxExtent);
    final accRatio =
        ratio.let(Curves.easeOutQuart.transform).let((it) => 1 - it);
    final easeRatio = ratio.let(Curves.ease.transform).let((it) => 1 - it);

    return Material(
      color: Colors.white,
      child: CustomPaint(
        painter: _HeaderBackgroundPainter(easeRatio),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildHeader(easeRatio),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: JobSiteAppBar(),
            ),
            _buildButton(easeRatio, easeRatio, maxWidth),
          ],
        ),
      ),
    );
  }

  // TODO(rhbrunetto): add "magnetic" behavior
  Widget _buildButton(double easeRatio, double accRatio, double width) {
    final left = width / 2 - 300;
    const bottom = kToolbarHeight + _buttonBottomPadding;

    return Positioned(
      bottom: bottom - ((bottom + 2) * (1 - accRatio)),
      left: left - ((1 - easeRatio) * (left - 24)),
      child: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const RegisterButton(),
      ),
    );
  }

  Widget _buildHeader(double ratio) {
    final top = kToolbarHeight - (maxExtent * (1 - ratio));

    return Positioned.fill(
      top: top,
      child: Opacity(
        opacity: ratio,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    title,
                    style: const TextStyle(
                      color: JobSiteColors.greyishBlueDark,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(height: _buttonSize, width: _imageSize),
                  const SizedBox(height: _buttonBottomPadding),
                ],
              ),
              const SizedBox(width: 50),
              Flexible(
                child: ClipOval(
                  child: Container(
                    width: _imageSize,
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
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate _) => false;
}

class _HeaderBackgroundPainter extends CustomPainter {
  _HeaderBackgroundPainter(this.opacity);

  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Path bezierPath = Path()
      ..lineTo(0, height)
      ..lineTo(width * 0.25, height)
      ..quadraticBezierTo(width * 0.75, height * 0.9, width, height * 0.91)
      ..lineTo(width, 0);

    final bezierPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          JobSiteColors.greyishBlueLightest.withOpacity(opacity),
          JobSiteColors.turquoiseLightest.withOpacity(opacity),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawPath(bezierPath, bezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

const _imageSize = 275.0;
const _buttonSize = 80.0;
const _buttonBottomPadding = 36.0;
