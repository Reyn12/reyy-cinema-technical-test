import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailContentShimmer extends StatelessWidget {
  const WFilmDetailContentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral30,
        highlightColor: AppColors.neutral10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 140,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.neutral30,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              width: 212,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: 220,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Container(
              width: 180,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (_) => Container(
                  width: 72,
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Container(
                    height: 64,
                    margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
                    decoration: BoxDecoration(
                      color: AppColors.neutral30,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 140,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.neutral30,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (_, _) => Container(
                  width: 96,
                  decoration: BoxDecoration(
                    color: AppColors.neutral30,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
