import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketFormatItem extends StatelessWidget {
  const WBuyTicketFormatItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.overlayNavy : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: AppColors.neutral40),
        ),
        child: Text(
          label,
          style: AppTypography.bodySemiboldS.copyWith(
            color: isSelected ? AppColors.white : AppColors.overlayNavy,
          ),
        ),
      ),
    );
  }
}
