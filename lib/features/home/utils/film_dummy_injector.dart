import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';

class FilmDummyInjector {
  const FilmDummyInjector._();

  static final posters = [
    Assets.images.imgDummyFilmPilihan1,
    Assets.images.imgDummyFilmPilihan2,
    Assets.images.imgDummySorotanBanner1,
  ];

  static final injectByEpisode = <int, InjectData>{
    1: const InjectData(
      genres: ['Action', 'Petualangan', 'Fantasi'],
      duration: '2j 16m',
      rating: '4.5',
      ratingCount: '9.8k',
      ageRating: 'SU',
      cinemaLabel: 'BIOSKOP REGULER',
    ),
    2: const InjectData(
      genres: ['Action', 'Drama', 'Sci-Fi'],
      duration: '2j 22m',
      rating: '4.6',
      ratingCount: '10.5k',
      ageRating: 'D 13+',
      cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
    ),
    3: const InjectData(
      genres: ['Action', 'Drama', 'Thriller'],
      duration: '2j 20m',
      rating: '4.8',
      ratingCount: '13.7k',
      ageRating: 'D 17+',
      cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
    ),
    4: const InjectData(
      genres: ['Action', 'Petualangan', 'Sci-Fi'],
      duration: '2j 01m',
      rating: '4.8',
      ratingCount: '12.4k',
      ageRating: 'D 13+',
      cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
    ),
    5: const InjectData(
      genres: ['Action', 'Drama', 'Sci-Fi'],
      duration: '2j 04m',
      rating: '4.9',
      ratingCount: '15.1k',
      ageRating: 'D 13+',
      cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
    ),
    6: const InjectData(
      genres: ['Action', 'Petualangan', 'Fantasi'],
      duration: '2j 11m',
      rating: '4.7',
      ratingCount: '11.2k',
      ageRating: 'D 13+',
      cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
    ),
  };

  static FilmModel fromSwapiJson(Map<String, dynamic> json, {int index = 0}) {
    final episodeValue = json['episode_id'];
    final episodeId = episodeValue is num
        ? episodeValue.toInt()
        : int.tryParse('$episodeValue') ?? 0;
    final data =
        injectByEpisode[episodeId] ??
        InjectData(
          genres: const ['Sci-Fi', 'Action'],
          duration: '2j 00m',
          rating: '4.5',
          ratingCount: '8.0k',
          ageRating: 'D 13+',
          cinemaLabel: 'BIOSKOP REGULER',
        );

    return FilmModel.fromSwapi(
      json,
      poster: posters[index % posters.length],
      genres: data.genres,
      duration: data.duration,
      rating: data.rating,
      ratingCount: data.ratingCount,
      ageRating: data.ageRating,
      cinemaLabel: data.cinemaLabel,
    );
  }

  static List<FilmModel> fromSwapiList(List<dynamic> results) {
    return List.generate(results.length, (index) {
      final item = results[index];
      return fromSwapiJson((item as Map).cast<String, dynamic>(), index: index);
    });
  }
}

class InjectData {
  const InjectData({
    required this.genres,
    required this.duration,
    required this.rating,
    required this.ratingCount,
    required this.ageRating,
    required this.cinemaLabel,
  });

  final List<String> genres;
  final String duration;
  final String rating;
  final String ratingCount;
  final String ageRating;
  final String cinemaLabel;
}
