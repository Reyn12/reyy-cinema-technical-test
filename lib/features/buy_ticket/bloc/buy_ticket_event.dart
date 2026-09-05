sealed class BuyTicketEvent {
  const BuyTicketEvent();
}

class BuyTicketDateSelected extends BuyTicketEvent {
  const BuyTicketDateSelected(this.index);

  final int index;
}
