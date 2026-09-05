import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/models/film_pilihan_model.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_film_pilihan_category_item.dart';

class WHomeFilmPilihanCategoryBuilder extends StatelessWidget {
  const WHomeFilmPilihanCategoryBuilder({
    super.key,
    required this.categories,
    required this.selectedCategoryIndex,
    required this.onCategorySelected,
  });

  final List<FilmPilihanCategoryModel> categories;
  final int selectedCategoryIndex;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return WHomeFilmPilihanCategoryItem(
            label: category.label,
            icon: category.icon,
            isSelected: index == selectedCategoryIndex,
            onTap: () => onCategorySelected(index),
          );
        },
      ),
    );
  }
}
