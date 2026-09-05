import 'package:reyy_cinema/gen/assets.gen.dart';

enum ReminderItemStatus {
  active,
  comingSoon,
}

enum ReminderItemAction {
  viewTicket,
  changeSchedule,
  remindWhenReleased,
}

class FilmReminderItemModel {
  const FilmReminderItemModel({
    required this.image,
    required this.title,
    required this.genresDuration,
    required this.scheduleLabel,
    required this.locationLabel,
    required this.countdownLabel,
    required this.status,
    required this.action,
  });

  final AssetGenImage image;
  final String title;
  final String genresDuration;
  final String scheduleLabel;
  final String locationLabel;
  final String countdownLabel;
  final ReminderItemStatus status;
  final ReminderItemAction action;
}
