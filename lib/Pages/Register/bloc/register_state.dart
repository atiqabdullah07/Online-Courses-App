// part of 'register_bloc.dart';

// abstract class RegisterState extends Equatable {
//   const RegisterState();

//   @override
//   List<Object> get props => [];
// }

// class RegisterInitial extends RegisterState {}

class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;
// Optional Named Parameters
  const RegisterState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.rePassword = ""});

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}


// The Objects that cannot change their values after the initialization are called immutable 
// Using Final Keyword and const Constructor can also make an object immutable
// Its a Good practice to make classes immutable
// Immutable classes are safe and with bloc it is recommended to make classes immutable
 