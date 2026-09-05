import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.orangeSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.orangeMain),
        boxShadow: AppShadows.smooth,
      ),
      child: Row(
        spacing: 6,
        children: [
          ImageLoad(
            src: Assets.icons.icInfo.path,
            isAsset: true,
            width: 16,
            height: 16,
          ),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodyRegularXs.copyWith(
                color: AppColors.neutral90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
