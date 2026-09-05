enum NotificationTab {
  all('Semua'),
  unread('Belum Dibaca'),
  read('Dibaca');

  const NotificationTab(this.label);

  final String label;
}

class NotificationModel {
  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAtLabel,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String description;
  final String createdAtLabel;
  final bool isRead;

  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    String? createdAtLabel,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAtLabel: createdAtLabel ?? this.createdAtLabel,
      isRead: isRead ?? this.isRead,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      createdAtLabel:
          (json['created_at_label'] ?? json['createdAtLabel'])?.toString() ??
              '',
      isRead: json['is_read'] as bool? ?? json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'created_at_label': createdAtLabel,
        'is_read': isRead,
      };
}
