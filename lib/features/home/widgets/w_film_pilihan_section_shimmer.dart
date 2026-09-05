import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmPilihanSectionShimmer extends StatelessWidget {
  const WFilmPilihanSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Shimmer.fromColors(
            baseColor: AppColors.neutral30,
            highlightColor: AppColors.neutral10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 110,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 48,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (_, _) => Shimmer.fromColors(
              baseColor: AppColors.neutral30,
              highlightColor: AppColors.neutral10,
              child: Container(
                width: 88,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.neutral30,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        const WFilmPilihanListShimmer(),
      ],
    );
  }
}

class WFilmPilihanListShimmer extends StatelessWidget {
  const WFilmPilihanListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, _) => const WFilmPilihanItemShimmer(),
      ),
    );
  }
}

class WFilmPilihanItemShimmer extends StatelessWidget {
  const WFilmPilihanItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.neutral30,
                  highlightColor: AppColors.neutral10,
                  child: Container(color: AppColors.neutral30),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.neutral30,
                    highlightColor: AppColors.neutral10,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.neutral30,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.neutral30,
                    highlightColor: AppColors.neutral10,
                    child: Container(
                      width: 48,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.neutral30,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Shimmer.fromColors(
              baseColor: AppColors.neutral30,
              highlightColor: AppColors.neutral10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
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
                    width: 90,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(20),
                    ),
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
