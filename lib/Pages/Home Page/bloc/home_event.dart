// part of 'home_bloc.dart';

// abstract class HomeEvent extends Equatable {
//   const HomeEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class HomeEvent {}

class ScrollEvent extends HomeEvent {
  final int index;

  ScrollEvent({required this.index});
}
