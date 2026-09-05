import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WSeatSelectFilmSummary extends StatelessWidget {
  const WSeatSelectFilmSummary({
    super.key,
    required this.image,
    required this.ageRating,
    required this.format,
    required this.rating,
    required this.title,
    required this.cinemaLabel,
    required this.dateLabel,
    required this.timeLabel,
  });

  final AssetGenImage image;
  final String ageRating;
  final String format;
  final String rating;
  final String title;
  final String cinemaLabel;
  final String dateLabel;
  final String timeLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 72,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageLoad(
                    src: image.path,
                    isAsset: true,
                    width: 72,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        ageRating,
                        style: AppTypography.bodySemiboldXs.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        format,
                        style: AppTypography.bodySemiboldXs.copyWith(
                          color: AppColors.primaryDeep,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: AppColors.warningMain,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: AppTypography.h8Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
                Text(
                  cinemaLabel,
                  style: AppTypography.bodyRegularS.copyWith(
                    color: AppColors.textColor50,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: AppColors.textColor50,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateLabel,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '•',
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Assets.icons.icClock.svg(
                      width: 12,
                      height: 12,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryDeep,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      timeLabel,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.primaryDeep,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
