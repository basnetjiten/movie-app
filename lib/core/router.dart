import 'package:auto_route/auto_route.dart';
import 'package:flutter_online_course/core/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page, path: '/'),
    //AutoRoute(page: MovieDetailRoute.page, path: '/movieDetailRoute'),
    //AutoRoute(page: MovieSearchRoute.page,path: '/movieSearchRoute'),
    //AutoRoute(page: BookmarkedMovieRoute.page,path: '/bookmarkedMovieRoute'),
  ];
}
