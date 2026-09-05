import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/home/models/home_banner_model.dart';
import 'package:reyy_cinema/features/home/models/home_promo_model.dart';
import 'package:reyy_cinema/features/home/models/home_sorotan_model.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

class HomeMocks {
  const HomeMocks._();

  static const promo = HomePromoModel(
    title: 'Diskon Hingga 50%',
    description:
        'Dapatkan promo menarik setiap Senin di bioskop XXI pilihanmu.',
    buttonText: 'Klaim Promo',
  );

  static List<HomeBannerModel> get banners => [
    HomeBannerModel(id: '1', imagePath: Assets.images.imgDummyBanner1.path),
    HomeBannerModel(id: '2', imagePath: Assets.images.imgDummyBanner2.path),
    HomeBannerModel(id: '3', imagePath: Assets.images.imgDummyBanner3.path),
  ];

  static List<FilmPilihanCategoryModel> get filmCategories => const [
    FilmPilihanCategoryModel(id: 'all', label: 'Semua', iconKey: 'semua'),
    FilmPilihanCategoryModel(id: 'action', label: 'Action', iconKey: 'action'),
    FilmPilihanCategoryModel(
      id: 'animasi',
      label: 'Animasi',
      iconKey: 'animasi',
    ),
    FilmPilihanCategoryModel(id: 'sci_fi', label: 'Sci-Fi', iconKey: 'sci_fi'),
    FilmPilihanCategoryModel(
      id: 'romance',
      label: 'Romance',
      iconKey: 'romance',
    ),
    FilmPilihanCategoryModel(id: 'horror', label: 'Horror', iconKey: 'horror'),
    FilmPilihanCategoryModel(id: 'comedy', label: 'Comedy', iconKey: 'comedy'),
  ];

  static List<FilmModel> get films {
    final posters = [
      Assets.images.imgDummyFilmPilihan1,
      Assets.images.imgDummyFilmPilihan2,
      Assets.images.imgDummySorotanBanner1,
      Assets.images.imgDummyFilmPilihan1,
      Assets.images.imgDummyFilmPilihan2,
      Assets.images.imgDummySorotanBanner1,
    ];

    final inject = [
      FilmInject(
        genres: const ['Action', 'Petualangan', 'Sci-Fi'],
        duration: '2j 01m',
        rating: '4.8',
        ratingCount: '12.4k',
        ageRating: 'D 13+',
        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
      ),
      FilmInject(
        genres: const ['Action', 'Drama', 'Sci-Fi'],
        duration: '2j 04m',
        rating: '4.9',
        ratingCount: '15.1k',
        ageRating: 'D 13+',
        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
      ),
      FilmInject(
        genres: const ['Action', 'Petualangan', 'Fantasi'],
        duration: '2j 11m',
        rating: '4.7',
        ratingCount: '11.2k',
        ageRating: 'D 13+',
        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
      ),
      FilmInject(
        genres: const ['Action', 'Petualangan', 'Fantasi'],
        duration: '2j 16m',
        rating: '4.5',
        ratingCount: '9.8k',
        ageRating: 'SU',
        cinemaLabel: 'BIOSKOP REGULER',
      ),
      FilmInject(
        genres: const ['Action', 'Drama', 'Sci-Fi'],
        duration: '2j 22m',
        rating: '4.6',
        ratingCount: '10.5k',
        ageRating: 'D 13+',
        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
      ),
      FilmInject(
        genres: const ['Action', 'Drama', 'Thriller'],
        duration: '2j 20m',
        rating: '4.8',
        ratingCount: '13.7k',
        ageRating: 'D 17+',
        cinemaLabel: 'BIOSKOP PREMIERE & REGULER',
      ),
    ];

    final raw = _swapiFilmResults;
    return List.generate(raw.length, (index) {
      final item = inject[index % inject.length];
      return FilmModel.fromSwapi(
        raw[index],
        poster: posters[index % posters.length],
        genres: item.genres,
        duration: item.duration,
        rating: item.rating,
        ratingCount: item.ratingCount,
        ageRating: item.ageRating,
        cinemaLabel: item.cinemaLabel,
      );
    });
  }

  static HomeSorotanModel get sorotan => HomeSorotanModel(film: films.first);

  static final List<Map<String, dynamic>> _swapiFilmResults = [
    {
      'title': 'A New Hope',
      'episode_id': 4,
      'opening_crawl':
          'It is a period of civil war. Rebel spaceships have won their first victory against the evil Galactic Empire.',
      'director': 'George Lucas',
      'producer': 'Gary Kurtz, Rick McCallum',
      'release_date': '1977-05-25',
      'url': 'https://swapi.dev/api/films/1/',
    },
    {
      'title': 'The Empire Strikes Back',
      'episode_id': 5,
      'opening_crawl':
          'It is a dark time for the Rebellion. Imperial troops have driven the Rebel forces from their hidden base.',
      'director': 'Irvin Kershner',
      'producer': 'Gary Kurtz, Rick McCallum',
      'release_date': '1980-05-17',
      'url': 'https://swapi.dev/api/films/2/',
    },
    {
      'title': 'Return of the Jedi',
      'episode_id': 6,
      'opening_crawl':
          'Luke Skywalker has returned to his home planet of Tatooine in an attempt to rescue his friend Han Solo.',
      'director': 'Richard Marquand',
      'producer': 'Howard G. Kazanjian, George Lucas, Rick McCallum',
      'release_date': '1983-05-25',
      'url': 'https://swapi.dev/api/films/3/',
    },
    {
      'title': 'The Phantom Menace',
      'episode_id': 1,
      'opening_crawl':
          'Turmoil has engulfed the Galactic Republic. The taxation of trade routes to outlying star systems is in dispute.',
      'director': 'George Lucas',
      'producer': 'Rick McCallum',
      'release_date': '1999-05-19',
      'url': 'https://swapi.dev/api/films/4/',
    },
    {
      'title': 'Attack of the Clones',
      'episode_id': 2,
      'opening_crawl':
          'There is unrest in the Galactic Senate. Several thousand solar systems have declared their intentions to leave the Republic.',
      'director': 'George Lucas',
      'producer': 'Rick McCallum',
      'release_date': '2002-05-16',
      'url': 'https://swapi.dev/api/films/5/',
    },
    {
      'title': 'Revenge of the Sith',
      'episode_id': 3,
      'opening_crawl':
          'War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku.',
      'director': 'George Lucas',
      'producer': 'Rick McCallum',
      'release_date': '2005-05-19',
      'url': 'https://swapi.dev/api/films/6/',
    },
  ];
}

class FilmInject {
  const FilmInject({
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
