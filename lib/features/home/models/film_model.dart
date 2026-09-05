import 'package:reyy_cinema/gen/assets.gen.dart';

class FilmModel {
  const FilmModel({
    required this.id,
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.url,
    required this.poster,
    required this.genres,
    required this.duration,
    required this.rating,
    required this.ratingCount,
    required this.ageRating,
    required this.cinemaLabel,
  });

  final int id;
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final String url;

  /// Injected — SWAPI gada field ini.
  final AssetGenImage poster;
  final List<String> genres;
  final String duration;
  final String rating;
  final String ratingCount;
  final String ageRating;
  final String cinemaLabel;

  String get genresLabel => genres.join(' • ');

  factory FilmModel.fromSwapi(
    Map<String, dynamic> json, {
    required AssetGenImage poster,
    required List<String> genres,
    required String duration,
    required String rating,
    required String ratingCount,
    required String ageRating,
    required String cinemaLabel,
  }) {
    final url = (json['url'] ?? '').toString();
    final idFromUrl =
        int.tryParse(url.split('/').where((e) => e.isNotEmpty).last) ?? 0;
    final episodeValue = json['episode_id'];

    return FilmModel(
      id: idFromUrl,
      title: (json['title'] ?? '').toString(),
      episodeId: episodeValue is num
          ? episodeValue.toInt()
          : int.tryParse('$episodeValue') ?? 0,
      openingCrawl: (json['opening_crawl'] ?? '').toString(),
      director: (json['director'] ?? '').toString(),
      producer: (json['producer'] ?? '').toString(),
      releaseDate: (json['release_date'] ?? '').toString(),
      url: url,
      poster: poster,
      genres: genres,
      duration: duration,
      rating: rating,
      ratingCount: ratingCount,
      ageRating: ageRating,
      cinemaLabel: cinemaLabel,
    );
  }
}
