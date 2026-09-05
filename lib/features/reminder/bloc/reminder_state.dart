import 'package:reyy_cinema/features/reminder/models/film_reminder_item_model.dart';

class ReminderState {
  const ReminderState({
    this.items = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  final List<FilmReminderItemModel> items;
  final bool isLoading;
  final bool hasError;

  int get activeCount => items.where((item) => item.isActive).length;

  ReminderState copyWith({
    List<FilmReminderItemModel>? items,
    bool? isLoading,
    bool? hasError,
  }) {
    return ReminderState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
