import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  deferredLoading: false,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        CustomRoute(
          page: FirstSectionRoute.page,
          maintainState: false,
          initial: true,
        ),
        CustomRoute(page: SecondSectionRoute.page, maintainState: false),
        CustomRoute(page: ThirdSectionRoute.page, maintainState: false),
      ],
    ),
  ];
}
