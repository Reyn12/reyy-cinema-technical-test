import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WBuyTicketCinemaListShimmer extends StatelessWidget {
  const WBuyTicketCinemaListShimmer({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 12,
        children: [
          for (var i = 0; i < itemCount; i++) const _CinemaCardShimmer(),
        ],
      ),
    );
  }
}

class _CinemaCardShimmer extends StatelessWidget {
  const _CinemaCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.neutral30,
                  highlightColor: AppColors.neutral10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Container(
                        width: 180,
                        height: 16,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Shimmer.fromColors(
                baseColor: AppColors.neutral30,
                highlightColor: AppColors.neutral10,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.neutral30,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          for (var i = 0; i < 2; i++) const _StudioBlockShimmer(),
        ],
      ),
    );
  }
}

class _StudioBlockShimmer extends StatelessWidget {
  const _StudioBlockShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral30,
      highlightColor: AppColors.neutral10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 64,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.neutral30,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < 4; i++)
                Container(
                  width: 68,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
