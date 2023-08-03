part of 'signin_bloc.dart';

// @immutable
// abstract class SigninState {}

// class SigninInitial extends SigninState {}

class SigninState {
  final String email;
  final String password;

  const SigninState({
    this.email = "",
    this.password = "",
  });

  SigninState copyWith({
    String? email,
    String? password,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

// What does the CopyWith do?
// It takes the earlier value (i.e email, password) and update it what the new value came
// It basically creates new object when a new value comes
// Remember the immutable objects cannot be directly changed after initialization
// Each time we are calling it we are creating new objects
// There are many other methods to do this thing. But this is the most Recommended  way
// Here we're making fields optional named parameters (email,password) so that we can emit states separately on them