// part of 'home_bloc.dart';

// abstract class HomeState extends Equatable {
//   const HomeState();

//   @override
//   List<Object> get props => [];
// }

// class HomeInitial extends HomeState {}

class HomeState {
  final int index;

  const HomeState({this.index = 0});

  HomeState copyWith({int? index}) {
    return HomeState(index: index ?? this.index);
  }
}
