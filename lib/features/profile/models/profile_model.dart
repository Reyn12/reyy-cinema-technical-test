class ProfileModel {
  const ProfileModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.memberTier = 'premiere_gold',
    this.memberLabel = 'Member Premiere Gold',
    this.watchedCount = 0,
    this.reminderCount = 0,
    this.loyaltyPoint = 0,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String memberTier;
  final String memberLabel;
  final int watchedCount;
  final int reminderCount;
  final int loyaltyPoint;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final idValue = json['id'] ?? json['ID'];
    return ProfileModel(
      id: idValue is num ? idValue.toInt() : int.tryParse('$idValue') ?? 0,
      name: (json['name'] ?? json['nama'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      phone: (json['phone'] ?? json['phone_number'] ?? json['no_telp'] ?? '')
          .toString(),
      avatarUrl: json['avatar_url']?.toString() ?? json['avatarUrl']?.toString(),
      memberTier: (json['member_tier'] ?? json['memberTier'] ?? 'premiere_gold')
          .toString(),
      memberLabel:
          (json['member_label'] ??
                  json['memberLabel'] ??
                  'Member Premiere Gold')
              .toString(),
      watchedCount: _toInt(json['watched_count'] ?? json['watchedCount']),
      reminderCount: _toInt(json['reminder_count'] ?? json['reminderCount']),
      loyaltyPoint: _toInt(json['loyalty_point'] ?? json['loyaltyPoint']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'member_tier': memberTier,
      'member_label': memberLabel,
      'watched_count': watchedCount,
      'reminder_count': reminderCount,
      'loyalty_point': loyaltyPoint,
    };
  }

  static int _toInt(dynamic value) {
    if (value is num) return value.toInt();
    return int.tryParse('$value') ?? 0;
  }
}
