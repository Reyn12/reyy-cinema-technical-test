import 'package:reyy_cinema/features/ticket_detail/models/ticket_detail_model.dart';

class TicketDetailState {
  const TicketDetailState({
    this.ticket,
    this.isLoading = false,
    this.hasError = false,
    this.mapsErrorMessage,
  });

  final TicketDetailModel? ticket;
  final bool isLoading;
  final bool hasError;
  final String? mapsErrorMessage;

  String get cinemaMapsQuery =>
      ticket?.cinemaMapsQuery ?? ticket?.cinemaName ?? '';

  TicketDetailState copyWith({
    TicketDetailModel? ticket,
    bool? isLoading,
    bool? hasError,
    String? mapsErrorMessage,
    bool clearMapsError = false,
  }) {
    return TicketDetailState(
      ticket: ticket ?? this.ticket,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      mapsErrorMessage:
          clearMapsError ? null : (mapsErrorMessage ?? this.mapsErrorMessage),
    );
  }
}
