import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WTicketDetailMovieInfo extends StatelessWidget {
  const WTicketDetailMovieInfo({
    super.key,
    required this.image,
    required this.ageRating,
    required this.duration,
    required this.title,
    required this.genres,
    required this.cinemaName,
  });

  final AssetGenImage image;
  final String ageRating;
  final String duration;
  final String title;
  final String genres;
  final String cinemaName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ImageLoad(
            src: image.path,
            isAsset: true,
            width: 72,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ageRating,
                      style: AppTypography.bodySemiboldXs.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '• $duration',
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.textColor50,
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
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: AppColors.textColor50,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      cinemaName,
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
