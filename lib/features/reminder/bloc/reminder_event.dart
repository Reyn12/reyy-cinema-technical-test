import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';

sealed class ReminderEvent {
  const ReminderEvent();
}

class ReminderLoadRequested extends ReminderEvent {
  const ReminderLoadRequested();
}

class ReminderTabChanged extends ReminderEvent {
  const ReminderTabChanged(this.tab);

  final ReminderTab tab;
}

class ReminderMarkAsRead extends ReminderEvent {
  const ReminderMarkAsRead(this.id);

  final String id;
}
