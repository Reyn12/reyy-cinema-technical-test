import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class AboutAppContentShimmer extends StatelessWidget {
  const AboutAppContentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral30,
        highlightColor: AppColors.neutral10,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.neutral30,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 140,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: 100,
              height: 14,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              height: 12,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 130,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            ...List.generate(3, (_) {
              return Container(
                width: MediaQuery.sizeOf(context).width * 0.65,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.neutral30,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
