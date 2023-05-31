import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCountEvent>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<DecrementCountEvent>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
