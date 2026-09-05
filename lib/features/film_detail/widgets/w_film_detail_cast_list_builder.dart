import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/film_detail/models/film_cast_item_model.dart';
import 'package:reyy_cinema/features/film_detail/widgets/w_film_detail_cast_item.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailCastListBuilder extends StatelessWidget {
  const WFilmDetailCastListBuilder({
    super.key,
    required this.items,
  });

  final List<FilmCastItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Daftar Pemeran',
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
              ),
              Text(
                '${items.length} Karakter Utama',
                style: AppTypography.bodyRegularS.copyWith(
                  color: AppColors.textColor50,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return WFilmDetailCastItem(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}
