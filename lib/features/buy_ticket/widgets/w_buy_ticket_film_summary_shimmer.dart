import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WBuyTicketFilmSummaryShimmer extends StatelessWidget {
  const WBuyTicketFilmSummaryShimmer({super.key});

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
            child: Shimmer.fromColors(
              baseColor: AppColors.neutral30,
              highlightColor: AppColors.neutral10,
              child: Container(
                width: 88,
                height: 120,
                color: AppColors.neutral30,
              ),
            ),
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.neutral30,
              highlightColor: AppColors.neutral10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: 120,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Container(
                        width: 72,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        width: 64,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
