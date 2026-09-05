import 'package:reyy_cinema/features/film_detail/models/film_cast_item_model.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';

class FilmDetailState {
  const FilmDetailState({
    this.film,
    this.casts = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  final FilmModel? film;
  final List<FilmCastItemModel> casts;
  final bool isLoading;
  final bool hasError;

  String get statusLabel => 'SEDANG TAYANG';

  String get writer {
    final producer = film?.producer ?? '';
    if (producer.isEmpty) return '-';
    return producer.split(',').first.trim();
  }

  String get cinemaStatus => 'Tayang Bioskop';

  FilmDetailState copyWith({
    FilmModel? film,
    List<FilmCastItemModel>? casts,
    bool? isLoading,
    bool? hasError,
  }) {
    return FilmDetailState(
      film: film ?? this.film,
      casts: casts ?? this.casts,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
