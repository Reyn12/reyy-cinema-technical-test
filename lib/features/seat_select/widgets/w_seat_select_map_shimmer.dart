import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WSeatSelectMapShimmer extends StatelessWidget {
  const WSeatSelectMapShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        spacing: 16,
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: AppColors.neutral10,
            child: Column(
              spacing: 8,
              children: [
                Container(
                  width: double.infinity,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Container(
                  width: 140,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          for (var i = 0; i < 6; i++) const _SeatRowShimmer(),
          Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: AppColors.neutral10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                for (var i = 0; i < 3; i++)
                  Container(
                    width: 64,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
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

class _SeatRowShimmer extends StatelessWidget {
  const _SeatRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral30,
      highlightColor: AppColors.neutral10,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.neutral30,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 6,
                  children: [
                    for (var i = 0; i < 4; i++)
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                  ],
                ),
                Row(
                  spacing: 6,
                  children: [
                    for (var i = 0; i < 4; i++)
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            width: 16,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.neutral30,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
