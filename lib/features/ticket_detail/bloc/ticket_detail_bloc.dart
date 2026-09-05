import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_event.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_state.dart';
import 'package:reyy_cinema/network/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailBloc({
    required this.ticketId,
    ApiService? apiService,
  }) : apiService = apiService ?? sharedApiService,
       super(const TicketDetailState(isLoading: true)) {
    on<TicketDetailLoadRequested>(onLoadRequested);
    on<TicketDetailOpenMapsRequested>(onOpenMapsRequested);
    on<TicketDetailMapsErrorCleared>(onMapsErrorCleared);
    add(const TicketDetailLoadRequested());
  }

  final String ticketId;
  final ApiService apiService;

  Future<void> onLoadRequested(
    TicketDetailLoadRequested event,
    Emitter<TicketDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false, clearMapsError: true));
    try {
      final ticket = await apiService.fetchTicketDetail(ticketId, mock: true);
      if (isClosed) return;
      emit(
        state.copyWith(
          ticket: ticket,
          isLoading: false,
          hasError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> onOpenMapsRequested(
    TicketDetailOpenMapsRequested event,
    Emitter<TicketDetailState> emit,
  ) async {
    final query = state.cinemaMapsQuery;
    if (query.isEmpty) {
      emit(state.copyWith(mapsErrorMessage: 'Lokasi bioskop belum tersedia'));
      return;
    }

    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );

    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (isClosed) return;

    if (!opened) {
      emit(state.copyWith(mapsErrorMessage: 'Gagal membuka Google Maps'));
    }
  }

  void onMapsErrorCleared(
    TicketDetailMapsErrorCleared event,
    Emitter<TicketDetailState> emit,
  ) {
    emit(state.copyWith(clearMapsError: true));
  }
}
