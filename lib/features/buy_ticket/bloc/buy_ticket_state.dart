import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';

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

  static const fullDayNames = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
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

  bool get hasSelectedSlot => selectedSlotId != null;

  BuyTicketCinemaModel? get selectedCinema {
    final slotId = selectedSlotId;
    if (slotId == null) return null;
    for (final cinema in cinemas) {
      for (final studio in cinema.studios) {
        if (studio.slots.any((slot) => slot.id == slotId)) {
          return cinema;
        }
      }
    }
    return null;
  }

  BuyTicketStudioModel? get selectedStudio {
    final slotId = selectedSlotId;
    if (slotId == null) return null;
    for (final cinema in cinemas) {
      for (final studio in cinema.studios) {
        if (studio.slots.any((slot) => slot.id == slotId)) {
          return studio;
        }
      }
    }
    return null;
  }

  BuyTicketTimeSlotModel? get selectedSlot {
    final slotId = selectedSlotId;
    if (slotId == null) return null;
    for (final cinema in cinemas) {
      for (final studio in cinema.studios) {
        for (final slot in studio.slots) {
          if (slot.id == slotId) return slot;
        }
      }
    }
    return null;
  }

  String get cinemaStudioLabel {
    final cinema = selectedCinema;
    final studio = selectedStudio;
    if (cinema == null || studio == null) return '-';
    return '${cinema.name} • ${studio.name}';
  }

  String get scheduleLabel {
    if (dates.isEmpty || selectedDateIndex >= dates.length) return '-';
    final date = dates[selectedDateIndex].date;
    final dayName = fullDayNames[date.weekday % 7];
    final month = monthShortNames[date.month - 1];
    final time = selectedSlot?.time ?? '--:--';
    return '$dayName, ${date.day} $month • $time WIB';
  }

  String get estimatedPriceLabel {
    final price = selectedStudio?.price;
    if (price == null) return '-';
    return formatRupiah(price);
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
