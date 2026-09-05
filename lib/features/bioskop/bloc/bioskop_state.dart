import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';
import 'package:reyy_cinema/features/bioskop/widgets/w_bioskop_select_cinema_bottom_sheet.dart';
import 'package:reyy_cinema/features/home/mappers/film_mapper.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

class BioskopState {
  const BioskopState({
    this.selectedCinema,
    this.films = const [],
    this.filmCategories = const [],
    this.selectedFilmCategoryIndex = 0,
    this.isFilmsLoading = false,
    this.hasFilmsError = false,
    this.cinemaPickerTicket = 0,
  });

  final CinemaModel? selectedCinema;
  final List<FilmModel> films;
  final List<FilmPilihanCategoryModel> filmCategories;
  final int selectedFilmCategoryIndex;
  final bool isFilmsLoading;
  final bool hasFilmsError;

  final int cinemaPickerTicket;

  CinemaModel get cinema =>
      selectedCinema ?? WBioskopSelectCinemaBottomSheet.cinemas.first;

  bool get isInitialFilmsLoading => isFilmsLoading && filmCategories.isEmpty;

  List<FilmPilihanItemModel> get filmPilihanItems => films.toFilmPilihanItems();

  BioskopState copyWith({
    CinemaModel? selectedCinema,
    List<FilmModel>? films,
    List<FilmPilihanCategoryModel>? filmCategories,
    int? selectedFilmCategoryIndex,
    bool? isFilmsLoading,
    bool? hasFilmsError,
    int? cinemaPickerTicket,
  }) {
    return BioskopState(
      selectedCinema: selectedCinema ?? this.selectedCinema,
      films: films ?? this.films,
      filmCategories: filmCategories ?? this.filmCategories,
      selectedFilmCategoryIndex:
          selectedFilmCategoryIndex ?? this.selectedFilmCategoryIndex,
      isFilmsLoading: isFilmsLoading ?? this.isFilmsLoading,
      hasFilmsError: hasFilmsError ?? this.hasFilmsError,
      cinemaPickerTicket: cinemaPickerTicket ?? this.cinemaPickerTicket,
    );
  }
}
