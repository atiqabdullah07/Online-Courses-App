import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ScrollEvent>(_scrollEvent);
  }

  void _scrollEvent(ScrollEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
