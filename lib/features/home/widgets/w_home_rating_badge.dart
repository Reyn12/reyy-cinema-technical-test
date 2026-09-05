import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeRatingBadge extends StatelessWidget {
  const WHomeRatingBadge({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  final String rating;
  final String ratingCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.icStar.svg(width: 13, height: 12),
          const SizedBox(width: 4),
          Text(
            rating,
            style: AppTypography.bodySemiboldS.copyWith(
              color: AppColors.neutral100,
            ),
          ),
          const SizedBox(width: 2),
          Text(
            '($ratingCount)',
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor50,
            ),
          ),
        ],
      ),
    );
  }
}
