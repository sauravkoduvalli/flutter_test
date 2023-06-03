import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<OnMenuChangeEvent>((event, emit) {
      // print("current index is ${event.currentIndex}");
      emit(state.copyWith(
        currentMenu: event.currentIndex,
      ));
      // print("current menu is ${state.currentMenu}");
    });
  }
}
