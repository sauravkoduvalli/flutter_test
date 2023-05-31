import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../service/service.dart';

class AppBlocProviders {
  static get appBlocProviders => [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) =>
              LoadAlbumBloc(ApiServices())..add(const LoadAlbumEvent()),
        ),
      ];
}
