import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';

sealed class BioskopEvent {
  const BioskopEvent();
}

class BioskopLoadRequested extends BioskopEvent {
  const BioskopLoadRequested();
}

class BioskopSelectCinemaRequested extends BioskopEvent {
  const BioskopSelectCinemaRequested();
}

class BioskopCinemaSelected extends BioskopEvent {
  const BioskopCinemaSelected(this.cinema);

  final CinemaModel cinema;
}

class BioskopFilmCategoryChanged extends BioskopEvent {
  const BioskopFilmCategoryChanged(this.categoryIndex);

  final int categoryIndex;
}
