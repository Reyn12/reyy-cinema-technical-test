import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';

class SeatSelectState {
  const SeatSelectState({
    this.rows = const [],
    this.selectedSeatIds = const {},
    this.isReminderEnabled = true,
    this.ticketPrice = 45000,
    this.serviceFee = 3000,
    this.formatLabel = 'Reguler 2D',
  });

  final List<SeatRowModel> rows;
  final Set<String> selectedSeatIds;
  final bool isReminderEnabled;
  final int ticketPrice;
  final int serviceFee;
  final String formatLabel;

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

  int get totalPayment =>
      hasSelectedSeats ? ticketsSubtotal + serviceFee : 0;

  String get ticketsPriceDetailLabel {
    return '$formatLabel ($selectedCount x ${formatRupiah(ticketPrice)})';
  }

  String get ticketsSubtotalLabel => formatRupiah(ticketsSubtotal);

  String get serviceFeeLabel =>
      hasSelectedSeats ? formatRupiah(serviceFee) : formatRupiah(0);

  String get totalPaymentLabel => formatRupiah(totalPayment);

  SeatSelectState copyWith({
    List<SeatRowModel>? rows,
    Set<String>? selectedSeatIds,
    bool? isReminderEnabled,
    int? ticketPrice,
    int? serviceFee,
    String? formatLabel,
  }) {
    return SeatSelectState(
      rows: rows ?? this.rows,
      selectedSeatIds: selectedSeatIds ?? this.selectedSeatIds,
      isReminderEnabled: isReminderEnabled ?? this.isReminderEnabled,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      serviceFee: serviceFee ?? this.serviceFee,
      formatLabel: formatLabel ?? this.formatLabel,
    );
  }
}
