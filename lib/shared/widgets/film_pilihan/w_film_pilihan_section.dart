import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_category_builder.dart';
import 'package:reyy_cinema/shared/widgets/film_pilihan/w_film_pilihan_item.dart';

class WFilmPilihanSection extends StatefulWidget {
  const WFilmPilihanSection({
    super.key,
    this.title = 'Film Pilihan',
    this.categories = const [],
    this.films = const [],
    required this.onTapSeeAll,
    required this.onTapLihatFilm,
  });

  final String title;
  final List<FilmPilihanCategoryModel> categories;
  final List<FilmPilihanItemModel> films;
  final VoidCallback onTapSeeAll;
  final ValueChanged<FilmPilihanItemModel> onTapLihatFilm;

  @override
  State<WFilmPilihanSection> createState() => _WFilmPilihanSectionState();
}

class _WFilmPilihanSectionState extends State<WFilmPilihanSection> {
  int selectedCategoryIndex = 0;

  List<FilmPilihanItemModel> get filteredFilms {
    final categories = widget.categories;
    if (categories.isEmpty) return widget.films;

    final selected = categories[selectedCategoryIndex.clamp(
      0,
      categories.length - 1,
    )];
    final isAll =
        selected.id == 'all' || selected.iconKey.toLowerCase() == 'semua';

    if (isAll) return widget.films;

    final key = selected.label.toLowerCase();
    return widget.films.where((film) {
      return film.genres.toLowerCase().contains(key);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final films = filteredFilms;
    final categories = widget.categories;

    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
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
        if (categories.isNotEmpty)
          WFilmPilihanCategoryBuilder(
            categories: categories,
            selectedCategoryIndex: selectedCategoryIndex,
            onCategorySelected: (index) {
              setState(() => selectedCategoryIndex = index);
            },
          ),
        if (films.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Text('Belum ada film'),
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
                  onTapLihatFilm: () => widget.onTapLihatFilm(film),
                );
              },
            ),
          ),
      ],
    );
  }
}
