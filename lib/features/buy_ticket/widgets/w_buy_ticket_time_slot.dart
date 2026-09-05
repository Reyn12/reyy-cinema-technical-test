import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBuyTicketTimeSlot extends StatelessWidget {
  const WBuyTicketTimeSlot({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  final BuyTicketTimeSlotModel slot;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isUnavailable = !slot.isAvailable;

    return GestureDetector(
      onTap: isUnavailable ? null : onTap,
      child: Container(
        width: 72,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isUnavailable
              ? AppColors.primarySurface
              : isSelected
              ? AppColors.primaryLight
              : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isUnavailable
                ? AppColors.primarySurface
                : isSelected
                ? AppColors.primary
                : AppColors.neutral40,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              slot.displayLabel,
              style: AppTypography.bodySemiboldS.copyWith(
                color: isUnavailable
                    ? AppColors.textColor50
                    : AppColors.overlayNavy,
              ),
            ),
            if (isSelected)
              Text(
                'Pilihan',
                style: AppTypography.bodyRegularXs.copyWith(
                  color: AppColors.primaryDeep,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
