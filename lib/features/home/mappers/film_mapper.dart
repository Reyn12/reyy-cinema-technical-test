import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

extension FilmModelMapper on FilmModel {
  FilmPilihanItemModel toFilmPilihanItem() {
    return FilmPilihanItemModel(
      image: poster,
      title: title,
      genres: genresLabel,
      duration: duration,
      rating: rating,
    );
  }
}

extension FilmModelListMapper on List<FilmModel> {
  List<FilmPilihanItemModel> toFilmPilihanItems() {
    return map((film) => film.toFilmPilihanItem()).toList();
  }
}
