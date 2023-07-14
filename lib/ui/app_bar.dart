import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

// TODO(rhbrunetto): Change to [SliverPersistentHeader] to keep register button
class JobSiteAppBar extends AppBar {
  JobSiteAppBar({
    super.key,
    super.title,
    super.automaticallyImplyLeading,
  }) : super(
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 93),
                  child: const TextButton(
                    onPressed: ignore,
                    child: Text('Login'),
                  ),
                ),
              ),
            ),
          ],
          elevation: 6.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          flexibleSpace: Container(
            height: 5.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  JobSiteColors.turquoiseDark,
                  JobSiteColors.blueRoyal,
                ],
              ),
            ),
          ),
        );
}
