sealed class TicketDetailEvent {
  const TicketDetailEvent();
}

class TicketDetailLoadRequested extends TicketDetailEvent {
  const TicketDetailLoadRequested();
}

class TicketDetailOpenMapsRequested extends TicketDetailEvent {
  const TicketDetailOpenMapsRequested();
}

class TicketDetailMapsErrorCleared extends TicketDetailEvent {
  const TicketDetailMapsErrorCleared();
}
