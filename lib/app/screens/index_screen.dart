import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../routes.gr.dart';
import '../../ui/app_bar.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        lazyLoad: true,
        routes: _pages.map((it) => it.page).toList(),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            appBar: RPAppBar(
              buttons: _pages
                  .mapIndexed(
                    (index, page) => RPAppBarButton(
                      label: page.label,
                      isActive: tabsRouter.activeIndex == index,
                      onTap: () {
                        if (tabsRouter.activeIndex == index) {
                          tabsRouter.popTop();
                        } else {
                          tabsRouter.setActiveIndex(index);
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
            body: child,
          );
        },
      );
}

class _Page {
  _Page(this.label, this.page);

  final String label;
  final PageRouteInfo page;
}

final _pages = [
  _Page('Home', const HomeRoute()),
  _Page('Projects', const ProjectsRoute()),
  _Page('Services', const ServicesRoute()),
  _Page('Blog', const BlogRoute()),
];
