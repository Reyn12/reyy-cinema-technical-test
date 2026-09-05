import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/image_load.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final bool isActive;
  final int index;
  final String label;
  final String iconPath;
  final String? activeIconPath;
  final VoidCallback onTap;

  const CustomBottomNavBarItem({
    super.key,
    required this.isActive,
    required this.index,
    required this.label,
    required this.iconPath,
    this.activeIconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.primaryPressed;
    final inactiveColor = AppColors.neutral50;
    final textColor = isActive ? activeColor : inactiveColor;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageLoad(
              src: isActive && activeIconPath != null
                  ? activeIconPath!
                  : iconPath,
              isAsset: true,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: AppTypography.h11Medium.fontSize,
                color: textColor,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

