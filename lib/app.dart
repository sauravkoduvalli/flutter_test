import 'package:first_project/screens/app_bloc_provider.dart';
import 'package:first_project/screens/on_boarding/on_boading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.appBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().appTheme(),
            routes: {
              '/': (context) => const OnBoardingScreen(),
            },
          );
        },
      ),
    );
  }
}
