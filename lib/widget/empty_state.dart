import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
  });

  final String title;
  final String subtitle;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageLoad(
          src: imagePath ?? Assets.images.imgEmptyState.path,
          width: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTypography.h8Bold.copyWith(color: AppColors.neutral100),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.bodyRegularS.copyWith(
            color: AppColors.neutral100,
          ),
        ),
      ],
    );
  }
}
