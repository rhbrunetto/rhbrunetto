import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../ui/app_bar.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/header.dart';
import 'widgets/sections/first.dart';
import 'widgets/sections/second.dart';
import 'widgets/sections/third.dart';
import 'widgets/tab_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO(rbrunetto): refactor to use AutoTabsRouter instead state
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: JobSiteAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                const HomeHeader(),
                HomeTabs(
                  tabs: _tabs.map((it) => it.name(context)).toList(),
                  headers: _tabs.map((it) => it.header(context)).toList(),
                  active: _activeIndex,
                  onSelect: (it) => setState(() => _activeIndex = it),
                ),
                _tabs.elementAt(_activeIndex).route,
                const SizedBox(height: 32.0),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const HomeBottomBar(),
      );
}

final _tabs = [
  _Tab(
    route: const FirstSectionScreen(),
    name: (context) => context.l10n.firstTab,
    header: (context) => context.l10n.firstSectionHeader,
  ),
  _Tab(
    route: const SecondSectionScreen(),
    name: (context) => context.l10n.secondTab,
    header: (context) => context.l10n.secondSectionHeader,
  ),
  _Tab(
    route: const ThirdSectionScreen(),
    name: (context) => context.l10n.thirdTab,
    header: (context) => context.l10n.thirdSectionHeader,
  ),
];

@immutable
class _Tab {
  const _Tab({
    required this.route,
    required this.name,
    required this.header,
  });

  final Widget route;
  final String Function(BuildContext) name;
  final String Function(BuildContext) header;
}
