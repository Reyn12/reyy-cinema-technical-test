import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/film_detail/models/film_cast_item_model.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WFilmDetailCastItem extends StatelessWidget {
  const WFilmDetailCastItem({
    super.key,
    required this.item,
  });

  final FilmCastItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        children: [
          ImageLoad(
            src: item.imageSrc,
            generateByName: item.actorName,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
            shapeImage: ShapeImage.circle,
          ),
          const SizedBox(height: 8),
          Text(
            item.actorName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.bodySemiboldS.copyWith(
              color: AppColors.overlayNavy,
            ),
          ),
          Text(
            item.characterName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor50,
            ),
          ),
        ],
      ),
    );
  }
}
