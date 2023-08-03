import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocapp/Pages/Register/bloc/register_event.dart';
import 'package:blocapp/Pages/Register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailRegEvent>(_emailRegEvent);
    on<PasswordRegEvent>(_passwordRegEvent);
    on<RePassEvent>(_rePassEvent);
  }

  FutureOr<void> _userNameEvent(
      UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  FutureOr<void> _emailRegEvent(
      EmailRegEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordRegEvent(
      PasswordRegEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _rePassEvent(RePassEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePass));
  }
}
