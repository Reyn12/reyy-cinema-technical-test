import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/widgets/w_film_pilihan_section_shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_category_builder.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_item.dart';
import 'package:reyy_cinema/widget/empty_state.dart';

class WFilmPilihanSection extends StatelessWidget {
  const WFilmPilihanSection({
    super.key,
    this.title = 'Film Pilihan',
    this.categories = const [],
    this.films = const [],
    this.selectedCategoryIndex = 0,
    this.isFilmsLoading = false,
    required this.onCategorySelected,
    required this.onTapSeeAll,
    required this.onTapLihatFilm,
  });

  final String title;
  final List<FilmPilihanCategoryModel> categories;
  final List<FilmPilihanItemModel> films;
  final int selectedCategoryIndex;
  final bool isFilmsLoading;
  final ValueChanged<int> onCategorySelected;
  final VoidCallback onTapSeeAll;
  final ValueChanged<FilmPilihanItemModel> onTapLihatFilm;

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
                title,
                style: AppTypography.h9Bold.copyWith(
                  color: AppColors.neutral100,
                ),
              ),
              GestureDetector(
                onTap: onTapSeeAll,
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
        if (categories.isNotEmpty)
          WFilmPilihanCategoryBuilder(
            categories: categories,
            selectedCategoryIndex: selectedCategoryIndex,
            onCategorySelected: onCategorySelected,
          ),
        if (isFilmsLoading)
          const WFilmPilihanListShimmer()
        else if (films.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: EmptyState(
              title: 'Belum ada film',
              subtitle: 'Coba pilih kategori lain atau cek lagi nanti.',
            ),
          )
        else
          SizedBox(
            height: 350,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: films.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final film = films[index];
                return WFilmPilihanItem(
                  image: film.image,
                  title: film.title,
                  genres: film.genres,
                  duration: film.duration,
                  rating: film.rating,
                  onTapLihatFilm: () => onTapLihatFilm(film),
                );
              },
            ),
          ),
      ],
    );
  }
}
