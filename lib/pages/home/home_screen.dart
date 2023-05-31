import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My First App"),
      ),
      body: BlocBuilder<LoadAlbumBloc, LoadAlbumState>(
        builder: (context, state) {
          switch (state.status) {
            case PageStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case PageStatus.failure:
              return Center(child: Text(state.error));
            case PageStatus.success:
              return Center(child: Text(state.result[0].title));
            default:
              const Center(child: Text("Some other issue happen"));
          }
          return Container();
        },
      ),
    );
  }
}
