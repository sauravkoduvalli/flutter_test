import 'package:first_project/bloc/on_boarding/on_boarding_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../service/service.dart';

class AppBlocProviders {
  static get appBlocProviders => [
        BlocProvider(
          create: (context) =>
              LoadAlbumBloc(ApiServices())..add(const LoadAlbumEvent()),
        ),
        BlocProvider(
          create: (context) => OnBoardingBloc(),
        )
      ];
}
