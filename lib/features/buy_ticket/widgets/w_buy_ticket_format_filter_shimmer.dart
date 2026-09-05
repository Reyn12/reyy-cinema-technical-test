import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WBuyTicketFormatFilterShimmer extends StatelessWidget {
  const WBuyTicketFormatFilterShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
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
    );
  }
}
