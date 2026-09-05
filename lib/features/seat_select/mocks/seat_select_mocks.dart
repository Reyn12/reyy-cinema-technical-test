import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_map_result.dart';

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

  static const weekendOccupiedSeatIds = {
    'A1',
    'A3',
    'B2',
    'B5',
    'B6',
    'C8',
    'D2',
    'D4',
    'E4',
    'E7',
    'F1',
    'F5',
    'F8',
  };

  static List<SeatRowModel> get seatRows => mapForSlot('default').rows;

  static SeatMapResult mapForSlot(String slotId) {
    final hash = slotId.hashCode.abs();
    final occupied = hash.isEven ? weekendOccupiedSeatIds : occupiedSeatIds;

    return SeatMapResult(
      serviceFee: 3000,
      rows: [
        for (final row in rows)
          SeatRowModel(
            row: row,
            seats: [
              for (var number = 1; number <= 8; number++)
                SeatItemModel(
                  id: '$row$number',
                  row: row,
                  number: number,
                  status: occupied.contains('$row$number')
                      ? SeatStatus.occupied
                      : SeatStatus.available,
                ),
            ],
          ),
      ],
    );
  }
}
