import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_select_cinema_bottom_sheet.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/network/api_service.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

import 'bioskop_event.dart';
import 'bioskop_state.dart';

class BioskopBloc extends Bloc<BioskopEvent, BioskopState> {
  BioskopBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(
        BioskopState(
          selectedCinema: WBioskopSelectCinemaBottomSheet.cinemas.first,
          isFilmsLoading: true,
        ),
      ) {
    on<BioskopLoadRequested>(onLoadRequested);
    on<BioskopSelectCinemaRequested>(onSelectCinemaRequested);
    on<BioskopCinemaSelected>(onCinemaSelected);
    on<BioskopFilmCategoryChanged>(onFilmCategoryChanged);
    add(const BioskopLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    BioskopLoadRequested event,
    Emitter<BioskopState> emit,
  ) async {
    emit(
      state.copyWith(
        isFilmsLoading: true,
        selectedFilmCategoryIndex: 0,
        hasFilmsError: false,
      ),
    );

    try {
      final results = await Future.wait([
        apiService.fetchFilms(mock: true, categoryId: 'all'),
        apiService.fetchFilmCategories(mock: true),
      ]);
      if (isClosed) return;

      emit(
        state.copyWith(
          films: results[0] as List<FilmModel>,
          filmCategories: results[1] as List<FilmPilihanCategoryModel>,
          selectedFilmCategoryIndex: 0,
          isFilmsLoading: false,
          hasFilmsError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isFilmsLoading: false, hasFilmsError: true));
    }
  }

  void onSelectCinemaRequested(
    BioskopSelectCinemaRequested event,
    Emitter<BioskopState> emit,
  ) {
    emit(state.copyWith(cinemaPickerTicket: state.cinemaPickerTicket + 1));
  }

  void onCinemaSelected(
    BioskopCinemaSelected event,
    Emitter<BioskopState> emit,
  ) {
    emit(state.copyWith(selectedCinema: event.cinema));
  }

  Future<void> onFilmCategoryChanged(
    BioskopFilmCategoryChanged event,
    Emitter<BioskopState> emit,
  ) async {
    if (state.filmCategories.isEmpty) return;
    if (event.categoryIndex == state.selectedFilmCategoryIndex &&
        !state.isFilmsLoading) {
      return;
    }

    final index = event.categoryIndex.clamp(0, state.filmCategories.length - 1);
    final categoryId = state.filmCategories[index].id;

    emit(
      state.copyWith(
        selectedFilmCategoryIndex: index,
        isFilmsLoading: true,
        hasFilmsError: false,
      ),
    );

    try {
      final films = await apiService.fetchFilms(
        mock: true,
        categoryId: categoryId,
      );
      if (isClosed) return;
      emit(
        state.copyWith(
          films: films,
          isFilmsLoading: false,
          hasFilmsError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isFilmsLoading: false, hasFilmsError: true));
    }
  }
}
