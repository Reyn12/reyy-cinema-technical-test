import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:shimmer/shimmer.dart';

class WTicketDetailPolicyShimmer extends StatelessWidget {
  const WTicketDetailPolicyShimmer({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            Container(
              width: 180,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            for (var i = 0; i < 3; i++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: AppColors.neutral30,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Container(
                          width: 120,
                          height: 14,
                          color: AppColors.neutral30,
                        ),
                        Container(
                          width: double.infinity,
                          height: 12,
                          color: AppColors.neutral30,
                        ),
                        Container(
                          width: 180,
                          height: 12,
                          color: AppColors.neutral30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
