import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WBuyTicketFilmSummary extends StatelessWidget {
  const WBuyTicketFilmSummary({
    super.key,
    required this.image,
    required this.ageRating,
    required this.rating,
    required this.duration,
    required this.title,
    required this.genres,
    required this.formats,
  });

  final AssetGenImage image;
  final String ageRating;
  final String rating;
  final String duration;
  final String title;
  final String genres;
  final List<String> formats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
              width: 88,
              height: 120,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageLoad(
                    src: image.path,
                    isAsset: true,
                    width: 88,
                    height: 120,
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
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: AppColors.primaryDeep,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.primaryDeep,
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
                    Text(
                      duration,
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
                  genres,
                  style: AppTypography.bodyRegularS.copyWith(
                    color: AppColors.textColor50,
                  ),
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final format in formats)
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
