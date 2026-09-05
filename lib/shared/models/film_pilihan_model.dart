import 'package:reyy_cinema/gen/assets.gen.dart';

class FilmPilihanCategoryModel {
  const FilmPilihanCategoryModel({
    required this.id,
    required this.label,
    required this.iconKey,
  });

  final String id;
  final String label;

  /// Key dari API, contoh: `semua`, `action`, `sci_fi`.
  final String iconKey;

  SvgGenImage get icon => resolveIcon(iconKey);

  factory FilmPilihanCategoryModel.fromJson(Map<String, dynamic> json) {
    return FilmPilihanCategoryModel(
      id: (json['id'] ?? '').toString(),
      label: (json['label'] ?? json['name'] ?? '').toString(),
      iconKey: (json['icon_key'] ?? json['iconKey'] ?? json['icon'] ?? 'semua')
          .toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'icon_key': iconKey,
    };
  }

  static SvgGenImage resolveIcon(String iconKey) {
    switch (iconKey.toLowerCase().replaceAll('-', '_')) {
      case 'action':
        return Assets.icons.icAction;
      case 'animasi':
      case 'animation':
        return Assets.icons.icAnimasi;
      case 'sci_fi':
      case 'scifi':
        return Assets.icons.icScifi;
      case 'romance':
        return Assets.icons.icRomance;
      case 'horror':
        return Assets.icons.icHorror;
      case 'comedy':
      case 'komedi':
        return Assets.icons.icComedy;
      case 'semua':
      case 'all':
      default:
        return Assets.icons.icSemua;
    }
  }
}

class FilmPilihanItemModel {
  const FilmPilihanItemModel({
    required this.id,
    required this.image,
    required this.title,
    required this.genres,
    required this.duration,
    required this.rating,
  });

  final int id;
  final AssetGenImage image;
  final String title;
  final String genres;
  final String duration;
  final String rating;
}
