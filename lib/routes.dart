import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  deferredLoading: false,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: IndexRoute.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProjectsRoute.page, path: 'projects'),
        AutoRoute(page: AboutRoute.page, path: 'about'),
        AutoRoute(page: BlogRoute.page, path: 'blog'),
      ],
    ),
  ];
}
