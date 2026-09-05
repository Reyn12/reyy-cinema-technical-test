class FilmCastItemModel {
  const FilmCastItemModel({
    required this.actorName,
    required this.characterName,
    this.imageSrc,
  });

  final String actorName;
  final String characterName;
  final String? imageSrc;
}
