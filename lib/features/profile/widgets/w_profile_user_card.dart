import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class WProfileUserCard extends StatelessWidget {
  const WProfileUserCard({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatarSrc,
    this.onTap,
  });

  final String name;
  final String subtitle;
  final String? avatarSrc;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.neutral10,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppShadows.smooth,
        ),
        child: Row(
          children: [
            ImageLoad(
              src: avatarSrc,
              isAsset: true,
              width: 48,
              height: 48,
              shapeImage: ShapeImage.circle,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: AppColors.neutral100,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.neutral80,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.north_east, size: 18, color: AppColors.neutral60),
          ],
        ),
      ),
    );
  }
}
