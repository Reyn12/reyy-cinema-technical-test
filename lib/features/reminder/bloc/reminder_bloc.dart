import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'reminder_event.dart';
import 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(const ReminderState(isLoading: true)) {
    on<ReminderLoadRequested>(onLoadRequested);
    on<ReminderTabChanged>(onTabChanged);
    on<ReminderMarkAsRead>(onMarkAsRead);
    add(const ReminderLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    ReminderLoadRequested event,
    Emitter<ReminderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final items = await apiService.fetchReminderList(mock: true);
      if (isClosed) return;
      emit(state.copyWith(items: items, isLoading: false, hasError: false));
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  void onTabChanged(ReminderTabChanged event, Emitter<ReminderState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }

  void onMarkAsRead(ReminderMarkAsRead event, Emitter<ReminderState> emit) {
    final updated = state.items.map((item) {
      if (item.id != event.id || item.isRead) return item;
      return item.copyWith(isRead: true);
    }).toList();
    emit(state.copyWith(items: updated));
  }
}
