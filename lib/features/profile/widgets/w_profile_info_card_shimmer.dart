import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WProfileInfoCardShimmer extends StatelessWidget {
  const WProfileInfoCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 48),
            padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppShadows.soft,
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.neutral30,
              highlightColor: AppColors.neutral10,
              child: Column(
                children: [
                  Container(
                    width: 180,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 200,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 160,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: AppColors.neutral10,
            child: Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: AppColors.neutral30,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
