import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_date_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketDateItem extends StatelessWidget {
  const WBuyTicketDateItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final BuyTicketDateModel item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.overlayNavy : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? null
              : Border.all(color: AppColors.neutral40),
          boxShadow: isSelected ? AppShadows.smooth : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Text(
              item.dayName,
              style: AppTypography.bodyRegularS.copyWith(
                color: isSelected ? AppColors.white : AppColors.overlayNavy,
              ),
            ),
            Text(
              item.dayNumber,
              style: AppTypography.h8Bold.copyWith(
                color: isSelected ? AppColors.white : AppColors.overlayNavy,
              ),
            ),
            Text(
              item.subLabel,
              style: AppTypography.bodyRegularXs.copyWith(
                color: isSelected ? AppColors.white : AppColors.textColor50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
