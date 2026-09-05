import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_event.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_state.dart';
import 'package:reyy_cinema/features/seat_select/mocks/seat_select_mocks.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';

class SeatSelectBloc extends Bloc<SeatSelectEvent, SeatSelectState> {
  SeatSelectBloc() : super(SeatSelectState(rows: SeatSelectMocks.seatRows)) {
    on<SeatSelectToggled>(onSeatToggled);
  }

  void onSeatToggled(SeatSelectToggled event, Emitter<SeatSelectState> emit) {
    SeatItemModel? target;
    for (final row in state.rows) {
      for (final seat in row.seats) {
        if (seat.id == event.seatId) {
          target = seat;
          break;
        }
      }
    }
    if (target == null || target.isOccupied) return;

    final selected = Set<String>.from(state.selectedSeatIds);
    if (selected.contains(event.seatId)) {
      selected.remove(event.seatId);
    } else {
      selected.add(event.seatId);
    }
    emit(state.copyWith(selectedSeatIds: selected));
  }
}
