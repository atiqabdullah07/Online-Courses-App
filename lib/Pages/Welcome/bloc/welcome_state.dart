part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class WelcomeInitial extends WelcomeState {}

// Hence we're doing a very simple thing so we dont have any need for a complex class
// So we're making it simple

class WelcomeState2 {
  var page;
  WelcomeState2({this.page = 0});
}
