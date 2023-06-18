import 'package:first_project/screens/auth/login/bloc/login_bloc.dart';
import 'package:first_project/screens/auth/login/login_screen.dart';
import 'package:first_project/screens/auth/register/bloc/register_bloc.dart';
import 'package:first_project/screens/auth/register/register_screen.dart';
import 'package:first_project/screens/home/home_screen.dart';
import 'package:first_project/screens/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:first_project/screens/on_boarding/on_boading_screen.dart';
import 'package:first_project/utils/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// For unifiying the Blocprovider with routes and app screens

class RouteScreens {
  List<PageEntities> routes = [
    PageEntities(
      route: RouteNames.INITIAL,
      screen: const OnBoardingScreen(),
      blocProvider: BlocProvider(create: (context) => OnBoardingBloc()),
    ),
    PageEntities(
      route: RouteNames.LOGIN,
      screen: const LoginScreen(),
      blocProvider: BlocProvider(create: (context) => LoginBloc()),
    ),
    PageEntities(
      route: RouteNames.REGISTER,
      screen: const RegisterScreen(),
      blocProvider: BlocProvider(create: (context) => RegisterBloc()),
    ),
    PageEntities(
      route: RouteNames.HOME,
      screen: const HomeScreen(),
      // blocProvider: BlocProvider(create: (context) => HomeBloc()),
    ),
  ];
}

class PageEntities {
  String route;
  Widget screen;
  dynamic blocProvider;

  PageEntities({
    required this.screen,
    required this.route,
    this.blocProvider,
  });
}
