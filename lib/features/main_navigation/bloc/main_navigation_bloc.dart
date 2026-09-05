import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_navigation_event.dart';

class MainNavigationBloc extends Bloc<MainNavigationEvent, int> {
  MainNavigationBloc() : super(0) {
    on<MainNavigationPageChanged>(onPageChanged);
  }

  void onPageChanged(
    MainNavigationPageChanged event,
    Emitter<int> emit,
  ) {
    emit(event.index);
  }
}
