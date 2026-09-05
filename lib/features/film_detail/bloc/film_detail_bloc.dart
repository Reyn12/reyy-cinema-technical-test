import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/film_detail/mocks/film_detail_mocks.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'film_detail_event.dart';
import 'film_detail_state.dart';

class FilmDetailBloc extends Bloc<FilmDetailEvent, FilmDetailState> {
  FilmDetailBloc({
    required this.filmId,
    ApiService? apiService,
  }) : apiService = apiService ?? sharedApiService,
       super(const FilmDetailState(isLoading: true)) {
    on<FilmDetailLoadRequested>(onLoadRequested);
    add(const FilmDetailLoadRequested());
  }

  final int filmId;
  final ApiService apiService;

  Future<void> onLoadRequested(
    FilmDetailLoadRequested event,
    Emitter<FilmDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final film = await apiService.fetchFilmDetail(filmId, mock: true);
      if (isClosed) return;
      emit(
        state.copyWith(
          film: film,
          casts: FilmDetailMocks.castForFilm(film.id),
          isLoading: false,
          hasError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
