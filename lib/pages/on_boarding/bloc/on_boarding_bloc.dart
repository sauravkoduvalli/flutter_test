import 'package:bloc/bloc.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
    on<OnBoardingEvent>((event, emit) {
      emit(OnBoardingState(page: event.currentPage));
    });
  }
}
