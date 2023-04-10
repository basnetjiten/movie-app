import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_course/core/router.dart';
import 'package:flutter_online_course/core/utils/hive_storage.dart';
import 'package:flutter_online_course/feature/auth/data/register_repo_imp.dart';
import 'package:flutter_online_course/feature/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_online_course/feature/auth/source/register_source.dart';
import 'package:flutter_online_course/feature/counter/data/data_source/movie_data_source.dart';
import 'package:flutter_online_course/feature/counter/data/models/movie_card_model.dart';
import 'package:flutter_online_course/feature/counter/data/repository/movie_repositoroy.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_cubit.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter_online_course/feature/counter/presentation/blocs/movie_cubit/movie_search_cubit/movie_search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieCardAdapter());
  await Hive.openBox('movieDB');

  getIt.registerLazySingleton<MovieSearchCubit>(() => MovieSearchCubit());
  // getIt.registerLazySingleton<RegisterSource>(() => RegisterSource());
  getIt.registerLazySingleton<MovieCubit>(() => MovieCubit());
  getIt.registerLazySingleton<MovieDetailsCubit>(() => MovieDetailsCubit());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<RegisterBloc>(() => RegisterBloc());
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepository(MovieDataSource()));
  HiveUtils.initDb();

  getIt.registerLazySingleton<RegisterRepoImpl>(
    () => RegisterRepoImpl(
      RegisterSource(
        HiveUtils(),
      ),
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
