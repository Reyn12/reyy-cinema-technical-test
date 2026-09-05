enum BuyTicketSlotStatus {
  available,
  soldOut,
  full,
}

enum BuyTicketBadgeType {
  loungeVip,
  ultimate,
}

class BuyTicketTimeSlotModel {
  const BuyTicketTimeSlotModel({
    required this.id,
    required this.time,
    this.status = BuyTicketSlotStatus.available,
  });

  final String id;
  final String time;
  final BuyTicketSlotStatus status;

  bool get isAvailable => status == BuyTicketSlotStatus.available;

  String get displayLabel {
    return switch (status) {
      BuyTicketSlotStatus.available => time,
      BuyTicketSlotStatus.soldOut => 'Habis',
      BuyTicketSlotStatus.full => 'Penuh',
    };
  }

  factory BuyTicketTimeSlotModel.fromJson(Map<String, dynamic> json) {
    final statusRaw = (json['status'] ?? 'available').toString();
    return BuyTicketTimeSlotModel(
      id: (json['id'] ?? '').toString(),
      time: (json['time'] ?? '').toString(),
      status: switch (statusRaw) {
        'sold_out' || 'soldOut' => BuyTicketSlotStatus.soldOut,
        'full' => BuyTicketSlotStatus.full,
        _ => BuyTicketSlotStatus.available,
      },
    );
  }
}

class BuyTicketStudioModel {
  const BuyTicketStudioModel({
    required this.id,
    required this.name,
    required this.price,
    required this.slots,
    this.badge,
    this.badgeType,
  });

  final String id;
  final String name;
  final int price;
  final List<BuyTicketTimeSlotModel> slots;
  final String? badge;
  final BuyTicketBadgeType? badgeType;

  factory BuyTicketStudioModel.fromJson(Map<String, dynamic> json) {
    final slotsJson = json['slots'];
    final badgeTypeRaw = json['badge_type'] ?? json['badgeType'];
    return BuyTicketStudioModel(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      price: json['price'] is num
          ? (json['price'] as num).toInt()
          : int.tryParse('${json['price']}') ?? 0,
      badge: json['badge']?.toString(),
      badgeType: switch (badgeTypeRaw?.toString()) {
        'lounge_vip' || 'loungeVip' => BuyTicketBadgeType.loungeVip,
        'ultimate' => BuyTicketBadgeType.ultimate,
        _ => null,
      },
      slots: slotsJson is List
          ? slotsJson
                .map(
                  (item) => BuyTicketTimeSlotModel.fromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }
}

class BuyTicketCinemaModel {
  const BuyTicketCinemaModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.distanceLabel,
    required this.address,
    required this.studios,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String brand;
  final String distanceLabel;
  final String address;
  final List<BuyTicketStudioModel> studios;
  final bool isFavorite;

  BuyTicketCinemaModel copyWith({bool? isFavorite}) {
    return BuyTicketCinemaModel(
      id: id,
      name: name,
      brand: brand,
      distanceLabel: distanceLabel,
      address: address,
      studios: studios,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory BuyTicketCinemaModel.fromJson(Map<String, dynamic> json) {
    final studiosJson = json['studios'];
    return BuyTicketCinemaModel(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      brand: (json['brand'] ?? '').toString(),
      distanceLabel:
          (json['distance_label'] ?? json['distanceLabel'] ?? '').toString(),
      address: (json['address'] ?? '').toString(),
      isFavorite: json['is_favorite'] == true || json['isFavorite'] == true,
      studios: studiosJson is List
          ? studiosJson
                .map(
                  (item) => BuyTicketStudioModel.fromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }
}
