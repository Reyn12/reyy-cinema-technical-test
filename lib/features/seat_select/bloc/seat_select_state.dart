import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_select_args.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';

class SeatSelectState {
  const SeatSelectState({
    required this.args,
    this.film,
    this.rows = const [],
    this.selectedSeatIds = const {},
    this.isReminderEnabled = true,
    this.serviceFee = 3000,
    this.isFilmLoading = false,
    this.isSeatsLoading = false,
    this.hasFilmError = false,
    this.hasSeatsError = false,
  });

  final SeatSelectArgs args;
  final FilmModel? film;
  final List<SeatRowModel> rows;
  final Set<String> selectedSeatIds;
  final bool isReminderEnabled;
  final int serviceFee;
  final bool isFilmLoading;
  final bool isSeatsLoading;
  final bool hasFilmError;
  final bool hasSeatsError;

  int get ticketPrice => args.ticketPrice;

  String get formatLabel => args.formatLabel;

  String get cinemaStudioLabel => args.cinemaStudioLabel;

  String get dateLabel => args.dateLabel;

  String get timeLabel => args.timeLabel;

  bool get isAnyLoading => isFilmLoading || isSeatsLoading;

  bool isSelected(String seatId) => selectedSeatIds.contains(seatId);

  bool get hasSelectedSeats => selectedSeatIds.isNotEmpty;

  int get selectedCount => selectedSeatIds.length;

  List<String> get sortedSelectedSeatIds {
    final seats = selectedSeatIds.toList()
      ..sort((a, b) {
        final rowCompare = a[0].compareTo(b[0]);
        if (rowCompare != 0) return rowCompare;
        final aNumber = int.tryParse(a.substring(1)) ?? 0;
        final bNumber = int.tryParse(b.substring(1)) ?? 0;
        return aNumber.compareTo(bNumber);
      });
    return seats;
  }

  String get selectedSeatsLabel {
    if (!hasSelectedSeats) return 'Belum dipilih (0 Kursi)';
    return '${sortedSelectedSeatIds.join(', ')} ($selectedCount Kursi)';
  }

  String get ticketCountLabel => '$selectedCount Tiket';

  int get ticketsSubtotal => selectedCount * ticketPrice;

  int get totalPayment => hasSelectedSeats ? ticketsSubtotal + serviceFee : 0;

  String get ticketsPriceDetailLabel {
    return '$formatLabel ($selectedCount x ${formatRupiah(ticketPrice)})';
  }

  String get ticketsSubtotalLabel => formatRupiah(ticketsSubtotal);

  String get serviceFeeLabel =>
      hasSelectedSeats ? formatRupiah(serviceFee) : formatRupiah(0);

  String get totalPaymentLabel => formatRupiah(totalPayment);

  SeatSelectState copyWith({
    SeatSelectArgs? args,
    FilmModel? film,
    List<SeatRowModel>? rows,
    Set<String>? selectedSeatIds,
    bool clearSelectedSeats = false,
    bool? isReminderEnabled,
    int? serviceFee,
    bool? isFilmLoading,
    bool? isSeatsLoading,
    bool? hasFilmError,
    bool? hasSeatsError,
  }) {
    return SeatSelectState(
      args: args ?? this.args,
      film: film ?? this.film,
      rows: rows ?? this.rows,
      selectedSeatIds: clearSelectedSeats
          ? const {}
          : selectedSeatIds ?? this.selectedSeatIds,
      isReminderEnabled: isReminderEnabled ?? this.isReminderEnabled,
      serviceFee: serviceFee ?? this.serviceFee,
      isFilmLoading: isFilmLoading ?? this.isFilmLoading,
      isSeatsLoading: isSeatsLoading ?? this.isSeatsLoading,
      hasFilmError: hasFilmError ?? this.hasFilmError,
      hasSeatsError: hasSeatsError ?? this.hasSeatsError,
    );
  }
}
