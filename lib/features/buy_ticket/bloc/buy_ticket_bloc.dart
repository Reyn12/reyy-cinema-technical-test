import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_event.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_state.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/network/api_service.dart';

class BuyTicketBloc extends Bloc<BuyTicketEvent, BuyTicketState> {
  BuyTicketBloc({
    required this.filmId,
    ApiService? apiService,
  }) : apiService = apiService ?? sharedApiService,
       super(
         BuyTicketState(
           dates: buildDates(),
           monthLabel: buildMonthLabel(),
           isFilmLoading: true,
           isSchedulesLoading: true,
         ),
       ) {
    on<BuyTicketLoadRequested>(onLoadRequested);
    on<BuyTicketDateSelected>(onDateSelected);
    on<BuyTicketFormatSelected>(onFormatSelected);
    on<BuyTicketFavoriteToggled>(onFavoriteToggled);
    on<BuyTicketSlotSelected>(onSlotSelected);
    add(const BuyTicketLoadRequested());
  }

  final int filmId;
  final ApiService apiService;

  static const dayNames = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];
  static const monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  static const monthShortNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  static List<BuyTicketDateModel> buildDates() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    final remainingDays = lastDayOfMonth - today.day + 1;
    final count = remainingDays < 7 ? remainingDays : 7;

    return List.generate(count, (index) {
      final date = today.add(Duration(days: index));
      return BuyTicketDateModel(
        date: date,
        dayName: dayNames[date.weekday % 7],
        dayNumber: '${date.day}',
        subLabel: index == 0
            ? 'Hari Ini'
            : index == 1
            ? 'Besok'
            : monthShortNames[date.month - 1],
      );
    });
  }

  static String buildMonthLabel() {
    final today = DateTime.now();
    return '${monthNames[today.month - 1]} ${today.year}';
  }

  Future<void> onLoadRequested(
    BuyTicketLoadRequested event,
    Emitter<BuyTicketState> emit,
  ) async {
    emit(
      state.copyWith(
        isFilmLoading: true,
        isSchedulesLoading: true,
        hasFilmError: false,
        hasSchedulesError: false,
        clearSelectedSlot: true,
        selectedFormatIndex: 0,
        selectedDateIndex: 0,
      ),
    );

    FilmModel? film = state.film;
    var hasFilmError = false;
    var hasSchedulesError = false;
    var formats = state.formats;
    var filmFormats = state.filmFormats;
    var cinemas = state.cinemas;

    await Future.wait([
      () async {
        try {
          film = await apiService.fetchFilmDetail(filmId, mock: true);
        } catch (_) {
          hasFilmError = true;
        }
      }(),
      () async {
        try {
          final date = state.dates.isNotEmpty
              ? state.dates.first.date
              : DateTime.now();
          final result = await apiService.fetchBuyTicketSchedules(
            filmId: filmId,
            date: date,
            mock: true,
          );
          formats = result.formats;
          filmFormats = result.filmFormats;
          cinemas = result.cinemas;
        } catch (_) {
          hasSchedulesError = true;
        }
      }(),
    ]);

    if (isClosed) return;

    emit(
      state.copyWith(
        film: film,
        formats: formats,
        filmFormats: filmFormats,
        cinemas: cinemas,
        isFilmLoading: false,
        isSchedulesLoading: false,
        hasFilmError: hasFilmError,
        hasSchedulesError: hasSchedulesError,
      ),
    );
  }

  Future<void> onDateSelected(
    BuyTicketDateSelected event,
    Emitter<BuyTicketState> emit,
  ) async {
    if (event.index == state.selectedDateIndex &&
        !state.isSchedulesLoading &&
        !state.hasSchedulesError) {
      return;
    }
    if (event.index < 0 || event.index >= state.dates.length) return;

    emit(
      state.copyWith(
        selectedDateIndex: event.index,
        isSchedulesLoading: true,
        hasSchedulesError: false,
        clearSelectedSlot: true,
        selectedFormatIndex: 0,
      ),
    );

    try {
      final result = await apiService.fetchBuyTicketSchedules(
        filmId: filmId,
        date: state.dates[event.index].date,
        mock: true,
      );
      if (isClosed) return;
      emit(
        state.copyWith(
          formats: result.formats,
          filmFormats: result.filmFormats.isEmpty
              ? state.filmFormats
              : result.filmFormats,
          cinemas: result.cinemas,
          isSchedulesLoading: false,
          hasSchedulesError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isSchedulesLoading: false, hasSchedulesError: true));
    }
  }

  void onFormatSelected(
    BuyTicketFormatSelected event,
    Emitter<BuyTicketState> emit,
  ) {
    emit(
      state.copyWith(
        selectedFormatIndex: event.index,
        clearSelectedSlot: true,
      ),
    );
  }

  void onFavoriteToggled(
    BuyTicketFavoriteToggled event,
    Emitter<BuyTicketState> emit,
  ) {
    final updated = state.cinemas.map((cinema) {
      if (cinema.id != event.cinemaId) return cinema;
      return cinema.copyWith(isFavorite: !cinema.isFavorite);
    }).toList();
    emit(state.copyWith(cinemas: updated));
  }

  void onSlotSelected(
    BuyTicketSlotSelected event,
    Emitter<BuyTicketState> emit,
  ) {
    if (state.selectedSlotId == event.slotId) {
      emit(state.copyWith(clearSelectedSlot: true));
      return;
    }
    emit(state.copyWith(selectedSlotId: event.slotId));
  }
}
