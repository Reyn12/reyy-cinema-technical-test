import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_event.dart';
import 'package:reyy_cinema/features/ticket_detail/bloc/ticket_detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailBloc() : super(const TicketDetailState()) {
    on<TicketDetailOpenMapsRequested>(onOpenMapsRequested);
    on<TicketDetailMapsErrorCleared>(onMapsErrorCleared);
  }

  Future<void> onOpenMapsRequested(
    TicketDetailOpenMapsRequested event,
    Emitter<TicketDetailState> emit,
  ) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(state.cinemaMapsQuery)}',
    );

    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (isClosed) return;

    if (!opened) {
      emit(
        state.copyWith(mapsErrorMessage: 'Gagal membuka Google Maps'),
      );
    }
  }

  void onMapsErrorCleared(
    TicketDetailMapsErrorCleared event,
    Emitter<TicketDetailState> emit,
  ) {
    emit(state.copyWith(clearMapsError: true));
  }
}
