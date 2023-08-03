part of 'signin_bloc.dart';

// Why is important to have an Abstract Class?
// Ans: Because only the parent class will be used inside the the on Function
@immutable
abstract class SigninEvent {
  const SigninEvent();
}

class EmailEvent extends SigninEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SigninEvent {
  final String password;
  const PasswordEvent(this.password);
}
