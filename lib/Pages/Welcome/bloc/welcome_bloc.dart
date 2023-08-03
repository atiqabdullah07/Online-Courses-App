import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent2, WelcomeState2> {
  WelcomeBloc() : super(WelcomeState2()) {
    //on<WelcomeEvent>((event, emit) {});
    print('Welocme Bloc');
    on<WelcomeEvent2>(
      (event, emit) {
        emit(WelcomeState2(page: state.page));
      },
    );
  }
}
