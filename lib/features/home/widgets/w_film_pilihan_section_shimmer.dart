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
        SizedBox(
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (_, _) => const _FilmCardShimmer(),
          ),
        ),
      ],
    );
  }
}

class _FilmCardShimmer extends StatelessWidget {
  const _FilmCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral30,
      highlightColor: AppColors.neutral10,
      child: Container(
        width: 168,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.neutral30,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
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
          ],
        ),
      ),
    );
  }
}
