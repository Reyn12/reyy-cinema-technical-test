import 'package:reyy_cinema/gen/assets.gen.dart';

class FilmPilihanCategoryModel {
  const FilmPilihanCategoryModel({
    required this.label,
    required this.icon,
  });

  final String label;
  final SvgGenImage icon;
}

class FilmPilihanItemModel {
  const FilmPilihanItemModel({
    required this.image,
    required this.title,
    required this.genres,
    required this.duration,
    required this.rating,
  });

  final AssetGenImage image;
  final String title;
  final String genres;
  final String duration;
  final String rating;
}
