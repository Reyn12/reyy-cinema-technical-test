import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeFilmPilihanCategoryItem extends StatelessWidget {
  const WHomeFilmPilihanCategoryItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final SvgGenImage icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = isSelected ? AppColors.white : AppColors.neutral100;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryPressed : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(color: AppColors.neutral40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon.svg(
              width: 14,
              height: 14,
              colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.bodySemiboldS.copyWith(color: foreground),
            ),
          ],
        ),
      ),
    );
  }
}
