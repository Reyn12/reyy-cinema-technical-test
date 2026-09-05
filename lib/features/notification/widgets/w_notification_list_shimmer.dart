import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WNotificationListShimmer extends StatelessWidget {
  const WNotificationListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: 6,
      separatorBuilder: (_, _) => const Divider(
        height: 1,
        color: AppColors.neutral30,
      ),
      itemBuilder: (_, _) => const _NotificationItemShimmer(),
    );
  }
}

class _NotificationItemShimmer extends StatelessWidget {
  const _NotificationItemShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral30,
        highlightColor: AppColors.neutral10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.neutral30,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: double.infinity,
                    height: 14,
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
          ],
        ),
      ),
    );
  }
}
