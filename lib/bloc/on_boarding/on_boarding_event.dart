part of 'on_boarding_bloc.dart';

class OnBoardingEvent extends Equatable {
  const OnBoardingEvent(this.newPageVal);

  final int newPageVal;

  @override
  List<Object> get props => [newPageVal];
}
