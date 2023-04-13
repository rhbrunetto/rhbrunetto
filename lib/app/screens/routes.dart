import 'package:auto_route/auto_route.dart';

import '../../routes.gr.dart';

final indexRoutes = AutoRoute(
  page: IndexRoute.page,
  path: '/',
  children: [
    AutoRoute(page: HomeRoute.page),
  ],
);
