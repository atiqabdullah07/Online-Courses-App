import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

// class SigninBloc extends Bloc<SigninEvent, SigninState> {
//   SigninBloc() : super(SigninInitial()) {
//     on<SigninEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  SignInBloc() : super(SigninState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);

    // on<PasswordEvent>(((event, emit) {
    //   emit(state.copyWith(email: event.password));
    // }));

    //Its Better to make a separate Method
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    // Anything in States File can be accessed using state.
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
