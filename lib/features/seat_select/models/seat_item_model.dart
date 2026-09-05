enum SeatStatus { available, occupied }

class SeatItemModel {
  const SeatItemModel({
    required this.id,
    required this.row,
    required this.number,
    this.status = SeatStatus.available,
  });

  final String id;
  final String row;
  final int number;
  final SeatStatus status;

  bool get isOccupied => status == SeatStatus.occupied;

  factory SeatItemModel.fromJson(Map<String, dynamic> json) {
    final statusRaw = (json['status'] ?? 'available').toString();
    return SeatItemModel(
      id: (json['id'] ?? '').toString(),
      row: (json['row'] ?? '').toString(),
      number: json['number'] is num
          ? (json['number'] as num).toInt()
          : int.tryParse('${json['number']}') ?? 0,
      status: statusRaw == 'occupied'
          ? SeatStatus.occupied
          : SeatStatus.available,
    );
  }
}

class SeatRowModel {
  const SeatRowModel({required this.row, required this.seats});

  final String row;
  final List<SeatItemModel> seats;

  factory SeatRowModel.fromJson(Map<String, dynamic> json) {
    final seatsJson = json['seats'];
    return SeatRowModel(
      row: (json['row'] ?? '').toString(),
      seats: seatsJson is List
          ? seatsJson
                .map(
                  (item) => SeatItemModel.fromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }
}
