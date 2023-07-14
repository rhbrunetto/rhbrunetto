import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'routes.dart';
import 'ui/theme.dart';

class JobSiteApp extends StatefulWidget {
  const JobSiteApp({super.key});

  @override
  State<JobSiteApp> createState() => _JobSiteAppState();
}

class _JobSiteAppState extends State<JobSiteApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router.config(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        // TODO(rhbrunetto): fix locales (de, en, br)
        supportedLocales: AppLocalizations.supportedLocales,
        theme: const JobSiteThemeData.dark().toMaterialTheme(),
        title: 'Deine Job website',
      );
}
