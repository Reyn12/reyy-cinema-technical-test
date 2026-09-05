import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeLatestBillCardShimmer extends StatelessWidget {
  const WHomeLatestBillCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral30,
        highlightColor: AppColors.neutral10,
        child: Column(
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.neutral30,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.neutral30,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 84,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                Container(
                  width: 180,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 120,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
