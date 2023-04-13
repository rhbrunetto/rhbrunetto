import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes.gr.dart';
import '../../ui/app_bar.dart';

@RoutePage()
class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final _key = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: RPAppBar(),
        body: AutoTabsRouter(
          lazyLoad: false,
          routes: [
            HomeRoute(),
          ],
        ),
      );
}
