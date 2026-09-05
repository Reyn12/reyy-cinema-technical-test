import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_event.dart';
import 'package:reyy_cinema/features/seat_select/bloc/seat_select_state.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_select_args.dart';
import 'package:reyy_cinema/network/api_service.dart';

class SeatSelectBloc extends Bloc<SeatSelectEvent, SeatSelectState> {
  SeatSelectBloc({
    required SeatSelectArgs args,
    ApiService? apiService,
  }) : apiService = apiService ?? sharedApiService,
       super(
         SeatSelectState(
           args: args,
           isFilmLoading: true,
           isSeatsLoading: true,
         ),
       ) {
    on<SeatSelectLoadRequested>(onLoadRequested);
    on<SeatSelectToggled>(onSeatToggled);
    on<SeatSelectReminderToggled>(onReminderToggled);
    add(const SeatSelectLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    SeatSelectLoadRequested event,
    Emitter<SeatSelectState> emit,
  ) async {
    emit(
      state.copyWith(
        isFilmLoading: true,
        isSeatsLoading: true,
        hasFilmError: false,
        hasSeatsError: false,
        clearSelectedSeats: true,
      ),
    );

    FilmModel? film = state.film;
    var rows = state.rows;
    var serviceFee = state.serviceFee;
    var hasFilmError = false;
    var hasSeatsError = false;

    await Future.wait([
      () async {
        try {
          film = await apiService.fetchFilmDetail(
            state.args.filmId,
            mock: true,
          );
        } catch (_) {
          hasFilmError = true;
        }
      }(),
      () async {
        try {
          final result = await apiService.fetchSeatMap(
            slotId: state.args.slotId,
            mock: true,
          );
          rows = result.rows;
          serviceFee = result.serviceFee;
        } catch (_) {
          hasSeatsError = true;
        }
      }(),
    ]);

    if (isClosed) return;

    emit(
      state.copyWith(
        film: film,
        rows: rows,
        serviceFee: serviceFee,
        isFilmLoading: false,
        isSeatsLoading: false,
        hasFilmError: hasFilmError,
        hasSeatsError: hasSeatsError,
      ),
    );
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

  void onReminderToggled(
    SeatSelectReminderToggled event,
    Emitter<SeatSelectState> emit,
  ) {
    emit(state.copyWith(isReminderEnabled: event.enabled));
  }
}
