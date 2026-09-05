class TicketDetailState {
  const TicketDetailState({
    this.cinemaMapsQuery = 'XXI Solo Square',
    this.mapsErrorMessage,
  });

  final String cinemaMapsQuery;
  final String? mapsErrorMessage;

  TicketDetailState copyWith({
    String? cinemaMapsQuery,
    String? mapsErrorMessage,
    bool clearMapsError = false,
  }) {
    return TicketDetailState(
      cinemaMapsQuery: cinemaMapsQuery ?? this.cinemaMapsQuery,
      mapsErrorMessage:
          clearMapsError ? null : (mapsErrorMessage ?? this.mapsErrorMessage),
    );
  }
}
