// part of 'app_bloc.dart';

// abstract class AppEvent extends Equatable {
//   const AppEvent();

//   @override
//   List<Object> get props => [];
// }

// A Constant Constructor can't call a non-constant super constructor of 'AppEvent'
// That's why in order to make a cont constructor in a child class we have to
// declare the constructor in the parent class also constant
abstract class AppEvent {
  const AppEvent();
}

class TriggerAppEvent extends AppEvent {
  // We want to get a variable from the UI thats why we are creating a variable here
  final int index;
  const TriggerAppEvent({required this.index}) : super();
}
