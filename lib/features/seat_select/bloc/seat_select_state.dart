import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';

class SeatSelectState {
  const SeatSelectState({
    this.rows = const [],
    this.selectedSeatIds = const {},
  });

  final List<SeatRowModel> rows;
  final Set<String> selectedSeatIds;

  bool isSelected(String seatId) => selectedSeatIds.contains(seatId);

  SeatSelectState copyWith({
    List<SeatRowModel>? rows,
    Set<String>? selectedSeatIds,
  }) {
    return SeatSelectState(
      rows: rows ?? this.rows,
      selectedSeatIds: selectedSeatIds ?? this.selectedSeatIds,
    );
  }
}
