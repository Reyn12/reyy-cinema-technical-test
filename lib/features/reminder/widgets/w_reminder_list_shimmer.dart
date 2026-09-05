import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WReminderListShimmer extends StatelessWidget {
  const WReminderListShimmer({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        for (var i = 0; i < itemCount; i++) const _ReminderCardShimmer(),
      ],
    );
  }
}

class _ReminderCardShimmer extends StatelessWidget {
  const _ReminderCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
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
                      Row(
                        spacing: 6,
                        children: [
                          Container(
                            width: 56,
                            height: 22,
                            decoration: BoxDecoration(
                              color: AppColors.neutral30,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: 72,
                            height: 22,
                            decoration: BoxDecoration(
                              color: AppColors.neutral30,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        width: 140,
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
                        width: 160,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.neutral30,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: AppColors.neutral10,
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(12),
                    ),
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
