import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailStatusHeader extends StatelessWidget {
  const WFilmDetailStatusHeader({
    super.key,
    required this.statusLabel,
    required this.onTapBookmark,
    required this.onTapShare,
  });

  final String statusLabel;
  final VoidCallback onTapBookmark;
  final VoidCallback onTapShare;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                statusLabel,
                style: AppTypography.bodySemiboldS.copyWith(
                  color: AppColors.overlayNavy,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTapBookmark,
              child: Assets.icons.icBookmark.svg(width: 40, height: 40),
            ),
            GestureDetector(
              onTap: onTapShare,
              child: Assets.icons.icShare.svg(width: 40, height: 40),
            ),
          ],
        ),
      ],
    );
  }
}
