import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';

class ReminderState {
  const ReminderState({
    this.selectedTab = ReminderTab.all,
    this.items = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  final ReminderTab selectedTab;
  final List<ReminderModel> items;
  final bool isLoading;
  final bool hasError;

  List<ReminderModel> get filteredItems {
    switch (selectedTab) {
      case ReminderTab.all:
        return items;
      case ReminderTab.unread:
        return items.where((item) => !item.isRead).toList();
      case ReminderTab.read:
        return items.where((item) => item.isRead).toList();
    }
  }

  bool get hasUnread => items.any((item) => !item.isRead);

  ReminderState copyWith({
    ReminderTab? selectedTab,
    List<ReminderModel>? items,
    bool? isLoading,
    bool? hasError,
  }) {
    return ReminderState(
      selectedTab: selectedTab ?? this.selectedTab,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
