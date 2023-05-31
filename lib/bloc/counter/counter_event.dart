part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCountEvent extends CounterEvent{
  const IncrementCountEvent();
}
class DecrementCountEvent extends CounterEvent{
  const DecrementCountEvent();
}
