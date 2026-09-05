import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/bioskop/models/cinema_model.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBioskopCinemaListItem extends StatelessWidget {
  const WBioskopCinemaListItem({
    super.key,
    required this.cinema,
    required this.isSelected,
    required this.onTap,
  });

  final CinemaModel cinema;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primarySurface : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Assets.icons.icBioskop.svg(
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primaryPressed : AppColors.neutral100,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    cinema.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: AppColors.primaryPressed,
                    ),
                  ),
                  Text(
                    cinema.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.textColor50,
                    ),
                  ),
                  Row(
                    children: [
                      Assets.icons.icRange.svg(
                        width: 12,
                        height: 12,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textColor50,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        cinema.distanceLabel,
                        style: AppTypography.bodyRegularS.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                size: 20,
                color: AppColors.primaryPressed,
              ),
          ],
        ),
      ),
    );
  }
}
