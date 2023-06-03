part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currentMenu = 0,
  });

  final int currentMenu;

  HomeState copyWith({
    final int? currentMenu,
  }) {
    return HomeState(
      currentMenu: currentMenu ?? this.currentMenu,
    );
  }

  @override
  List<Object> get props => [currentMenu];
}
