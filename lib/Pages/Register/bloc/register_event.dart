// part of 'register_bloc.dart';

// abstract class RegisterEvent extends Equatable {
//   const RegisterEvent();

//   @override
//   List<Object> get props => [];
// }

abstract class RegisterEvent {
  const RegisterEvent(); // This is the default Constructor
}

class UserNameEvent extends RegisterEvent {
  final String userName;

  const UserNameEvent(this.userName);
}

class EmailRegEvent extends RegisterEvent {
  final String email;

  const EmailRegEvent(this.email);
}

class PasswordRegEvent extends RegisterEvent {
  final String password;

  const PasswordRegEvent(this.password);
}

class RePassEvent extends RegisterEvent {
  final String rePass;

  const RePassEvent(this.rePass);
}
