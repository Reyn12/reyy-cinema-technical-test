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
}
