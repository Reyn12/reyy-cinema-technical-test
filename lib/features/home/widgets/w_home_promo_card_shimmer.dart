import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomePromoCardShimmer extends StatelessWidget {
  const WHomePromoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryPressed,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.smooth,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.white.withValues(alpha: 0.2),
        highlightColor: AppColors.white.withValues(alpha: 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Container(
              width: 78,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: 180,
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: double.infinity,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 220,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
