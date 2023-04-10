// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_online_course/feature/auth/presentation/login_screen.dart'
    as _i1;
import 'package:flutter_online_course/feature/auth/presentation/screens/register_screen.dart'
    as _i2;
import 'package:flutter_online_course/feature/counter/data/models/movie_details_model.dart'
    as _i9;
import 'package:flutter_online_course/feature/counter/presentation/screeens/bookmarked_movie_screen.dart'
    as _i3;
import 'package:flutter_online_course/feature/counter/presentation/screeens/movie_detail_screen.dart'
    as _i4;
import 'package:flutter_online_course/feature/counter/presentation/screeens/movie_home_screen.dart'
    as _i5;
import 'package:flutter_online_course/feature/counter/presentation/screeens/movie_search_screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegisterScreen(),
      );
    },
    BookmarkedMovieRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BookmarkedMovieScreen(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MovieDetailScreen(
          key: args.key,
          movieDetailsModel: args.movieDetailsModel,
        ),
      );
    },
    MovieHomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MovieHomeScreen(),
      );
    },
    MovieSearchRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MovieSearchScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BookmarkedMovieScreen]
class BookmarkedMovieRoute extends _i7.PageRouteInfo<void> {
  const BookmarkedMovieRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BookmarkedMovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkedMovieRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MovieDetailScreen]
class MovieDetailRoute extends _i7.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i8.Key? key,
    required _i9.MovieDetailsModel movieDetailsModel,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieDetailsModel: movieDetailsModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const _i7.PageInfo<MovieDetailRouteArgs> page =
      _i7.PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    required this.movieDetailsModel,
  });

  final _i8.Key? key;

  final _i9.MovieDetailsModel movieDetailsModel;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieDetailsModel: $movieDetailsModel}';
  }
}

/// generated route for
/// [_i5.MovieHomeScreen]
class MovieHomeRoute extends _i7.PageRouteInfo<void> {
  const MovieHomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MovieHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieHomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MovieSearchScreen]
class MovieSearchRoute extends _i7.PageRouteInfo<void> {
  const MovieSearchRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MovieSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieSearchRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
