import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_event.dart';
import 'package:reyy_cinema/features/buy_ticket/bloc/buy_ticket_state.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';

class BuyTicketBloc extends Bloc<BuyTicketEvent, BuyTicketState> {
  BuyTicketBloc() : super(_initialState()) {
    on<BuyTicketDateSelected>(onDateSelected);
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
    );
  }

  void onDateSelected(
    BuyTicketDateSelected event,
    Emitter<BuyTicketState> emit,
  ) {
    emit(state.copyWith(selectedDateIndex: event.index));
  }
}
