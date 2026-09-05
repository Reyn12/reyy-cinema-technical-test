import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_event.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_state.dart';
import 'package:reyy_cinema/features/buy_ticket/mocks/buy_ticket_mocks.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';

class BuyTicketBloc extends Bloc<BuyTicketEvent, BuyTicketState> {
  BuyTicketBloc() : super(_initialState()) {
    on<BuyTicketDateSelected>(onDateSelected);
    on<BuyTicketFormatSelected>(onFormatSelected);
    on<BuyTicketFavoriteToggled>(onFavoriteToggled);
    on<BuyTicketSlotSelected>(onSlotSelected);
  }

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

  static BuyTicketState _initialState() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    final remainingDays = lastDayOfMonth - today.day + 1;
    final count = remainingDays < 7 ? remainingDays : 7;

    final dates = List.generate(count, (index) {
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

    return BuyTicketState(
      dates: dates,
      monthLabel: '${monthNames[today.month - 1]} ${today.year}',
      formats: BuyTicketMocks.formats,
      cinemas: BuyTicketMocks.cinemas,
      selectedSlotId: 'slot-1a-3',
    );
  }

  void onDateSelected(
    BuyTicketDateSelected event,
    Emitter<BuyTicketState> emit,
  ) {
    emit(state.copyWith(selectedDateIndex: event.index));
  }

  void onFormatSelected(
    BuyTicketFormatSelected event,
    Emitter<BuyTicketState> emit,
  ) {
    emit(state.copyWith(selectedFormatIndex: event.index));
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
