import 'package:first_project/pages/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding/bloc/on_boarding_bloc.dart';

class AppBlocProviders {
  static get appBlocProviders => [
        BlocProvider(create: (context) => OnBoardingBloc()),
        BlocProvider(create: (context) => LoginBloc())
      ];
}
