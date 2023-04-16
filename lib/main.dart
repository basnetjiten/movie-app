import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_course/core/router.dart';
import 'package:flutter_online_course/feature/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bootstrap.dart';

GetIt getIt = GetIt.instance;

void main() async {
  await bootstrap();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
