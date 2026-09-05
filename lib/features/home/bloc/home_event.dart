sealed class HomeEvent {
  const HomeEvent();
}

class HomeLoadRequested extends HomeEvent {
  const HomeLoadRequested();
}

class HomeFilmCategoryChanged extends HomeEvent {
  const HomeFilmCategoryChanged(this.categoryIndex);

  final int categoryIndex;
}
