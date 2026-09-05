class SeatSelectArgs {
  const SeatSelectArgs({
    required this.filmId,
    required this.slotId,
    required this.cinemaStudioLabel,
    required this.dateLabel,
    required this.timeLabel,
    required this.formatLabel,
    required this.ticketPrice,
  });

  final int filmId;
  final String slotId;
  final String cinemaStudioLabel;
  final String dateLabel;
  final String timeLabel;
  final String formatLabel;
  final int ticketPrice;

  static const fallback = SeatSelectArgs(
    filmId: 1,
    slotId: 'slot-1a-1',
    cinemaStudioLabel: 'XXI Solo Square • Reguler 2D',
    dateLabel: 'Hari Ini',
    timeLabel: '13:00 WIB',
    formatLabel: 'Reguler 2D',
    ticketPrice: 45000,
  );
}
