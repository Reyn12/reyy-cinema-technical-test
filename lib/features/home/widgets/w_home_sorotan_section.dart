import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_dark_badge.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_genre_chip.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_rating_badge.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WHomeSorotanSection extends StatelessWidget {
  const WHomeSorotanSection({
    super.key,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.ageRating,
    required this.cinemaLabel,
    required this.movieTitle,
    required this.duration,
    required this.genres,
    required this.onTapSeeAll,
    required this.onTapBookTicket,
  });

  final AssetGenImage image;
  final String rating;
  final String ratingCount;
  final String ageRating;
  final String cinemaLabel;
  final String movieTitle;
  final String duration;
  final List<String> genres;
  final VoidCallback onTapSeeAll;
  final VoidCallback onTapBookTicket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sorotan Pekan Ini',
                style: AppTypography.h9Bold.copyWith(
                  color: AppColors.neutral100,
                ),
              ),
              GestureDetector(
                onTap: onTapSeeAll,
                child: Text(
                  'Lihat Semua',
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: AppShadows.smooth,
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ImageLoad(
                        src: image.path,
                        isAsset: true,
                        width: double.infinity,
                        height: 210,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: AppGradients.imageOverlayTop,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: WHomeRatingBadge(
                          rating: rating,
                          ratingCount: ratingCount,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: WHomeDarkBadge(label: ageRating),
                      ),
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    cinemaLabel,
                                    style: AppTypography.bodySemiboldS.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    movieTitle,
                                    style: AppTypography.h9Bold.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            WHomeDarkBadge(
                              leading: Assets.icons.icClock.svg(
                                width: 12,
                                height: 12,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              label: duration,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final genre in genres)
                            WHomeGenreChip(label: genre),
                        ],
                      ),
                      PrimaryButton.withIcon(
                        text: 'Pesan Tiket',
                        color: AppColors.primary,
                        textColor: AppColors.white,
                        leading: Assets.icons.icTicket.svg(
                          width: 15,
                          height: 12,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: onTapBookTicket,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
