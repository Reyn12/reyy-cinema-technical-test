sealed class SeatSelectEvent {
  const SeatSelectEvent();
}

class SeatSelectToggled extends SeatSelectEvent {
  const SeatSelectToggled(this.seatId);

  final String seatId;
}
