import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/models/film_pilihan_model.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_film_pilihan_category_builder.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_film_pilihan_item.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeFilmPilihanSection extends StatefulWidget {
  const WHomeFilmPilihanSection({
    super.key,
    required this.onTapSeeAll,
    required this.onTapLihatFilm,
  });

  final VoidCallback onTapSeeAll;
  final VoidCallback onTapLihatFilm;

  @override
  State<WHomeFilmPilihanSection> createState() =>
      _WHomeFilmPilihanSectionState();
}

class _WHomeFilmPilihanSectionState extends State<WHomeFilmPilihanSection> {
  int selectedCategoryIndex = 0;

  static final categories = [
    FilmPilihanCategoryModel(label: 'Semua', icon: Assets.icons.icSemua),
    FilmPilihanCategoryModel(label: 'Action', icon: Assets.icons.icAction),
    FilmPilihanCategoryModel(label: 'Animasi', icon: Assets.icons.icAnimasi),
    FilmPilihanCategoryModel(label: 'Sci-Fi', icon: Assets.icons.icScifi),
    FilmPilihanCategoryModel(label: 'Romance', icon: Assets.icons.icRomance),
    FilmPilihanCategoryModel(label: 'Horror', icon: Assets.icons.icHorror),
    FilmPilihanCategoryModel(label: 'Comedy', icon: Assets.icons.icComedy),
  ];

  static final films = [
    FilmPilihanItemModel(
      image: Assets.images.imgDummyFilmPilihan1,
      title: 'Cyberia: Protocol',
      genres: 'Sci-Fi • Thriller',
      duration: '1j 52m',
      rating: '4.9',
    ),
    FilmPilihanItemModel(
      image: Assets.images.imgDummyFilmPilihan2,
      title: 'Kiko dan Hutan Cahaya',
      genres: 'Animasi • Petualangan',
      duration: '1j 38m',
      rating: '4.7',
    ),
    FilmPilihanItemModel(
      image: Assets.images.imgDummyFilmPilihan1,
      title: 'Cyberia: Protocol',
      genres: 'Sci-Fi • Thriller',
      duration: '1j 52m',
      rating: '4.9',
    ),
    FilmPilihanItemModel(
      image: Assets.images.imgDummyFilmPilihan2,
      title: 'Kiko dan Hutan Cahaya',
      genres: 'Animasi • Petualangan',
      duration: '1j 38m',
      rating: '4.7',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Film Pilihan',
                style: AppTypography.h9Bold.copyWith(
                  color: AppColors.neutral100,
                ),
              ),
              GestureDetector(
                onTap: widget.onTapSeeAll,
                child: Text(
                  'Semua',
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        WHomeFilmPilihanCategoryBuilder(
          categories: categories,
          selectedCategoryIndex: selectedCategoryIndex,
          onCategorySelected: (index) {
            setState(() => selectedCategoryIndex = index);
          },
        ),
        SizedBox(
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: films.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final film = films[index];
              return WHomeFilmPilihanItem(
                image: film.image,
                title: film.title,
                genres: film.genres,
                duration: film.duration,
                rating: film.rating,
                onTapLihatFilm: widget.onTapLihatFilm,
              );
            },
          ),
        ),
      ],
    );
  }
}
