import 'dart:async';

import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>(_appEvent);
  }

  FutureOr<void> _appEvent(TriggerAppEvent event, Emitter<AppState> emit) {
    emit(AppState(index: event.index));
  }
}
