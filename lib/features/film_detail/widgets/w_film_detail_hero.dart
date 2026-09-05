import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_genre_chip.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WFilmDetailHero extends StatelessWidget {
  const WFilmDetailHero({
    super.key,
    required this.image,
    required this.ageRating,
    required this.rating,
    required this.ratingCount,
    required this.duration,
    required this.title,
    required this.genres,
  });

  final AssetGenImage image;
  final String ageRating;
  final String rating;
  final String ratingCount;
  final String duration;
  final String title;
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Container(
          width: 212,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppShadows.smooth,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoad(
                  src: image.path,
                  isAsset: true,
                  width: 212,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      ageRating,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: AppShadows.smooth,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: 16,
                color: AppColors.warningMain,
              ),
              const SizedBox(width: 4),
              Text(
                rating,
                style: AppTypography.bodySemiboldM.copyWith(
                  color: AppColors.overlayNavy,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '($ratingCount ulasan)',
                style: AppTypography.bodyRegularS.copyWith(
                  color: AppColors.textColor50,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 1,
                height: 16,
                color: AppColors.shadesPrimary20,
              ),
              const SizedBox(width: 10),
              Assets.icons.icClock.svg(
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  AppColors.overlayNavy,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                duration,
                style: AppTypography.bodySemiboldM.copyWith(
                  color: AppColors.overlayNavy,
                ),
              ),
            ],
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTypography.h7Bold.copyWith(
            color: AppColors.overlayNavy,
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final genre in genres) WHomeGenreChip(label: genre),
          ],
        ),
      ],
    );
  }
}
