import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';

class SeatSelectMocks {
  const SeatSelectMocks._();

  static const rows = ['A', 'B', 'C', 'D', 'E', 'F'];
  static const occupiedSeatIds = {
    'A3',
    'B2',
    'B6',
    'C8',
    'D2',
    'E4',
    'E7',
    'F1',
    'F5',
  };

  static List<SeatRowModel> get seatRows {
    return [
      for (final row in rows)
        SeatRowModel(
          row: row,
          seats: [
            for (var number = 1; number <= 8; number++)
              SeatItemModel(
                id: '$row$number',
                row: row,
                number: number,
                status: occupiedSeatIds.contains('$row$number')
                    ? SeatStatus.occupied
                    : SeatStatus.available,
              ),
          ],
        ),
    ];
  }
}
