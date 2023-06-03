part of 'on_boarding_bloc.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({this.page = 0});

  final int page;

  OnBoardingState copyWith({
    final int? page
  }) {
    return OnBoardingState(page: page ?? this.page);
  }
  
  @override
  List<Object> get props => [page];
}
