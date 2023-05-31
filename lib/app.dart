import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/app_bloc_provider.dart';
import 'pages/on_boarding/on_boading_screen.dart';
import 'utils/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.appBlocProviders,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().appTheme(),
        routes: {
          '/': (context) => const OnBoardingScreen(),
        },
      ),
    );
  }
}
