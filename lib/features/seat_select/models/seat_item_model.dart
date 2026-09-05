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
}

class SeatRowModel {
  const SeatRowModel({required this.row, required this.seats});

  final String row;
  final List<SeatItemModel> seats;
}
