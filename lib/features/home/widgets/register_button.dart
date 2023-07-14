import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../../../ui/colors.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          colors: [JobSiteColors.turquoiseDark, JobSiteColors.blueRoyal],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: ignore,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          child: Text(
            context.l10n.registerButton,
            style: const TextStyle(
              fontSize: 14,
              color: JobSiteColors.turquoiseLightest,
              letterSpacing: 0.84,
            ),
          ),
        ),
      ),
    );
}
