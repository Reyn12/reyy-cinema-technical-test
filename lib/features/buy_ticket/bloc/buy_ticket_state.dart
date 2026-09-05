import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';

class BuyTicketState {
  const BuyTicketState({
    this.selectedDateIndex = 0,
    this.dates = const [],
    this.monthLabel = 'Oktober 2024',
  });

  final int selectedDateIndex;
  final List<BuyTicketDateModel> dates;
  final String monthLabel;

  BuyTicketState copyWith({
    int? selectedDateIndex,
    List<BuyTicketDateModel>? dates,
    String? monthLabel,
  }) {
    return BuyTicketState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      dates: dates ?? this.dates,
      monthLabel: monthLabel ?? this.monthLabel,
    );
  }
}
