import 'package:reyy_cinema/features/notification/models/notification_model.dart';

class NotificationState {
  const NotificationState({
    this.selectedTab = NotificationTab.all,
    this.items = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  final NotificationTab selectedTab;
  final List<NotificationModel> items;
  final bool isLoading;
  final bool hasError;

  List<NotificationModel> get filteredItems {
    switch (selectedTab) {
      case NotificationTab.all:
        return items;
      case NotificationTab.unread:
        return items.where((item) => !item.isRead).toList();
      case NotificationTab.read:
        return items.where((item) => item.isRead).toList();
    }
  }

  bool get hasUnread => items.any((item) => !item.isRead);

  NotificationState copyWith({
    NotificationTab? selectedTab,
    List<NotificationModel>? items,
    bool? isLoading,
    bool? hasError,
  }) {
    return NotificationState(
      selectedTab: selectedTab ?? this.selectedTab,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
