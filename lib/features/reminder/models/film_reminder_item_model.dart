import 'package:reyy_cinema/gen/assets.gen.dart';

enum ReminderItemStatus { active, comingSoon }

enum ReminderItemAction { viewTicket, changeSchedule, remindWhenReleased }

class FilmReminderItemModel {
  const FilmReminderItemModel({
    required this.id,
    required this.image,
    required this.title,
    required this.genresDuration,
    required this.scheduleLabel,
    required this.locationLabel,
    required this.countdownLabel,
    required this.status,
    required this.action,
  });

  final String id;
  final AssetGenImage image;
  final String title;
  final String genresDuration;
  final String scheduleLabel;
  final String locationLabel;
  final String countdownLabel;
  final ReminderItemStatus status;
  final ReminderItemAction action;

  bool get isActive => status == ReminderItemStatus.active;

  factory FilmReminderItemModel.fromJson(Map<String, dynamic> json) {
    final statusRaw = (json['status'] ?? 'active').toString();
    final actionRaw = (json['action'] ?? 'view_ticket').toString();
    final imageIndex = json['image_index'] is num
        ? (json['image_index'] as num).toInt()
        : int.tryParse('${json['image_index'] ?? 0}') ?? 0;

    return FilmReminderItemModel(
      id: (json['id'] ?? '').toString(),
      image: _imageByIndex(imageIndex),
      title: (json['title'] ?? '').toString(),
      genresDuration: (json['genres_duration'] ?? json['genresDuration'] ?? '')
          .toString(),
      scheduleLabel: (json['schedule_label'] ?? json['scheduleLabel'] ?? '')
          .toString(),
      locationLabel: (json['location_label'] ?? json['locationLabel'] ?? '')
          .toString(),
      countdownLabel: (json['countdown_label'] ?? json['countdownLabel'] ?? '')
          .toString(),
      status: statusRaw == 'coming_soon' || statusRaw == 'comingSoon'
          ? ReminderItemStatus.comingSoon
          : ReminderItemStatus.active,
      action: switch (actionRaw) {
        'change_schedule' ||
        'changeSchedule' => ReminderItemAction.changeSchedule,
        'remind_when_released' ||
        'remindWhenReleased' => ReminderItemAction.remindWhenReleased,
        _ => ReminderItemAction.viewTicket,
      },
    );
  }

  static AssetGenImage _imageByIndex(int index) {
    final images = [
      Assets.images.imgDummyReminderItem1,
      Assets.images.imgDummyReminderItem2,
      Assets.images.imgDummyReminderItem3,
    ];
    return images[index % images.length];
  }
}
