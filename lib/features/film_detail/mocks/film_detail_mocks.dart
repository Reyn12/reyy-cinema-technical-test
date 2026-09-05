import 'package:reyy_cinema/features/film_detail/models/film_cast_item_model.dart';

class FilmDetailMocks {
  const FilmDetailMocks._();

  static List<FilmCastItemModel> castForFilm(int filmId) {
    final casts = _castsByFilmId[filmId];
    if (casts != null) return casts;
    return _defaultCast;
  }

  static const _defaultCast = [
    FilmCastItemModel(actorName: 'Mark Hamill', characterName: 'Luke Skywalker'),
    FilmCastItemModel(actorName: 'Harrison Ford', characterName: 'Han Solo'),
    FilmCastItemModel(actorName: 'Carrie Fisher', characterName: 'Leia Organa'),
    FilmCastItemModel(actorName: 'Anthony Daniels', characterName: 'C-3PO'),
  ];

  static const _castsByFilmId = <int, List<FilmCastItemModel>>{
    1: [
      FilmCastItemModel(actorName: 'Mark Hamill', characterName: 'Luke Skywalker'),
      FilmCastItemModel(actorName: 'Harrison Ford', characterName: 'Han Solo'),
      FilmCastItemModel(actorName: 'Carrie Fisher', characterName: 'Leia Organa'),
      FilmCastItemModel(actorName: 'Alec Guinness', characterName: 'Obi-Wan Kenobi'),
    ],
    2: [
      FilmCastItemModel(actorName: 'Mark Hamill', characterName: 'Luke Skywalker'),
      FilmCastItemModel(actorName: 'Harrison Ford', characterName: 'Han Solo'),
      FilmCastItemModel(actorName: 'Carrie Fisher', characterName: 'Leia Organa'),
      FilmCastItemModel(actorName: 'Billy Dee W.', characterName: 'Lando Calrissian'),
    ],
    3: [
      FilmCastItemModel(actorName: 'Mark Hamill', characterName: 'Luke Skywalker'),
      FilmCastItemModel(actorName: 'Harrison Ford', characterName: 'Han Solo'),
      FilmCastItemModel(actorName: 'Carrie Fisher', characterName: 'Leia Organa'),
      FilmCastItemModel(actorName: 'Ian McDiarmid', characterName: 'Emperor'),
    ],
    4: [
      FilmCastItemModel(actorName: 'Liam Neeson', characterName: 'Qui-Gon Jinn'),
      FilmCastItemModel(actorName: 'Ewan McGregor', characterName: 'Obi-Wan Kenobi'),
      FilmCastItemModel(actorName: 'Natalie Portman', characterName: 'Padmé Amidala'),
      FilmCastItemModel(actorName: 'Jake Lloyd', characterName: 'Anakin Skywalker'),
    ],
    5: [
      FilmCastItemModel(actorName: 'Ewan McGregor', characterName: 'Obi-Wan Kenobi'),
      FilmCastItemModel(actorName: 'Natalie Portman', characterName: 'Padmé Amidala'),
      FilmCastItemModel(actorName: 'Hayden Christensen', characterName: 'Anakin Skywalker'),
      FilmCastItemModel(actorName: 'Christopher L.', characterName: 'Count Dooku'),
    ],
    6: [
      FilmCastItemModel(actorName: 'Ewan McGregor', characterName: 'Obi-Wan Kenobi'),
      FilmCastItemModel(actorName: 'Natalie Portman', characterName: 'Padmé Amidala'),
      FilmCastItemModel(actorName: 'Hayden Christensen', characterName: 'Anakin Skywalker'),
      FilmCastItemModel(actorName: 'Ian McDiarmid', characterName: 'Palpatine'),
    ],
  };
}
