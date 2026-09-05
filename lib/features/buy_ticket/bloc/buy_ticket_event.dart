sealed class BuyTicketEvent {
  const BuyTicketEvent();
}

class BuyTicketDateSelected extends BuyTicketEvent {
  const BuyTicketDateSelected(this.index);

  final int index;
}

class BuyTicketFormatSelected extends BuyTicketEvent {
  const BuyTicketFormatSelected(this.index);

  final int index;
}

class BuyTicketFavoriteToggled extends BuyTicketEvent {
  const BuyTicketFavoriteToggled(this.cinemaId);

  final String cinemaId;
}

class BuyTicketSlotSelected extends BuyTicketEvent {
  const BuyTicketSlotSelected(this.slotId);

  final String slotId;
}
