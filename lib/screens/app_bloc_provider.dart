import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/login/bloc/login_bloc.dart';
import 'auth/register/bloc/register_bloc.dart';
import 'on_boarding/bloc/on_boarding_bloc.dart';

class AppBlocProviders {
  static get appBlocProviders => [
        BlocProvider(create: (context) => OnBoardingBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
