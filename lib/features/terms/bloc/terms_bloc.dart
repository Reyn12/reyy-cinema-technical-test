import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'terms_event.dart';
import 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  TermsBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(const TermsState(isLoading: true)) {
    on<TermsLoadRequested>(onLoadRequested);
    add(const TermsLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    TermsLoadRequested event,
    Emitter<TermsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final data = await apiService.fetchTermsContent(mock: true);
      if (isClosed) return;
      emit(state.copyWith(data: data, isLoading: false, hasError: false));
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
