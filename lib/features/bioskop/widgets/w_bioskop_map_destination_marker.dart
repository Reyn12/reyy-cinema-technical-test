import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBioskopMapDestinationMarker extends StatelessWidget {
  const WBioskopMapDestinationMarker({
    super.key,
    required this.cinemaName,
  });

  final String cinemaName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryPressed,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  cinemaName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: AppColors.primaryPressed,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.movie_creation_outlined,
            size: 18,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
