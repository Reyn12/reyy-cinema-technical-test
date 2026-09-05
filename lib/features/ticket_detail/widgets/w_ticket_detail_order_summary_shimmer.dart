import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WTicketDetailOrderSummaryShimmer extends StatelessWidget {
  const WTicketDetailOrderSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral30,
        highlightColor: AppColors.neutral10,
        child: Column(
          spacing: 12,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Container(
                  width: 56,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            for (var i = 0; i < 4; i++)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 12,
                      color: AppColors.neutral30,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    width: 100,
                    height: 12,
                    color: AppColors.neutral30,
                  ),
                ],
              ),
            Container(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
