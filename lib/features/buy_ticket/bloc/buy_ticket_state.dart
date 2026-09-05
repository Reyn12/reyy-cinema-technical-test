import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';

class BuyTicketState {
  const BuyTicketState({
    this.selectedDateIndex = 0,
    this.selectedFormatIndex = 0,
    this.selectedSlotId,
    this.dates = const [],
    this.formats = const [],
    this.cinemas = const [],
    this.monthLabel = '',
  });

  final int selectedDateIndex;
  final int selectedFormatIndex;
  final String? selectedSlotId;
  final List<BuyTicketDateModel> dates;
  final List<String> formats;
  final List<BuyTicketCinemaModel> cinemas;
  final String monthLabel;

  String get selectedFormat {
    if (formats.isEmpty) return 'Semua Format';
    return formats[selectedFormatIndex];
  }

  List<BuyTicketCinemaModel> get filteredCinemas {
    if (selectedFormatIndex == 0 || selectedFormat == 'Semua Format') {
      return cinemas;
    }
    if (selectedFormat == 'IMAX') {
      return cinemas
          .where(
            (cinema) => cinema.studios.any(
              (studio) => studio.name.toUpperCase().contains('IMAX'),
            ),
          )
          .toList();
    }
    return cinemas
        .where((cinema) => cinema.brand == selectedFormat)
        .toList();
  }

  BuyTicketState copyWith({
    int? selectedDateIndex,
    int? selectedFormatIndex,
    String? selectedSlotId,
    bool clearSelectedSlot = false,
    List<BuyTicketDateModel>? dates,
    List<String>? formats,
    List<BuyTicketCinemaModel>? cinemas,
    String? monthLabel,
  }) {
    return BuyTicketState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
      selectedFormatIndex: selectedFormatIndex ?? this.selectedFormatIndex,
      selectedSlotId:
          clearSelectedSlot ? null : selectedSlotId ?? this.selectedSlotId,
      dates: dates ?? this.dates,
      formats: formats ?? this.formats,
      cinemas: cinemas ?? this.cinemas,
      monthLabel: monthLabel ?? this.monthLabel,
    );
  }
}
