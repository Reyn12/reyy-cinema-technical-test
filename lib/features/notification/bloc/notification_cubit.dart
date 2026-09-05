import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/notification/models/notification_model.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({ApiService? apiService})
    : _apiService = apiService ?? sharedApiService,
      super(const NotificationState(isLoading: true)) {
    load();
  }

  final ApiService _apiService;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final items = await _apiService.fetchNotificationList(mock: true);
      if (isClosed) return;
      emit(state.copyWith(items: items, isLoading: false, hasError: false));
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  void setSelectedTab(NotificationTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void markAsRead(String id) {
    final updated = state.items.map((item) {
      if (item.id != id || item.isRead) return item;
      return item.copyWith(isRead: true);
    }).toList();
    emit(state.copyWith(items: updated));
  }
}
