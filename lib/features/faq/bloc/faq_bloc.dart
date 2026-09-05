import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'faq_event.dart';
import 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(const FaqState(isLoading: true)) {
    on<FaqLoadRequested>(onLoadRequested);
    add(const FaqLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    FaqLoadRequested event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final items = await apiService.fetchFaqList(mock: true);
      if (isClosed) return;
      emit(state.copyWith(items: items, isLoading: false, hasError: false));
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
