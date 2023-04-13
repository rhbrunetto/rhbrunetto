import 'package:flutter/material.dart';

import '../routes.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _State();
}

class _State extends State<PortfolioApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'MavenPro'),
        title: 'Ricardo Brunetto',
      );
}
