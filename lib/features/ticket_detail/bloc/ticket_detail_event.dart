sealed class TicketDetailEvent {
  const TicketDetailEvent();
}

class TicketDetailOpenMapsRequested extends TicketDetailEvent {
  const TicketDetailOpenMapsRequested();
}

class TicketDetailMapsErrorCleared extends TicketDetailEvent {
  const TicketDetailMapsErrorCleared();
}
