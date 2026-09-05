import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_item_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WSeatSelectSeatItem extends StatelessWidget {
  const WSeatSelectSeatItem({
    super.key,
    required this.seat,
    required this.isSelected,
    required this.onTap,
  });

  final SeatItemModel seat;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isOccupied = seat.isOccupied;

    return GestureDetector(
      onTap: isOccupied ? null : onTap,
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : AppColors.primarySurfaceAlt,
          borderRadius: BorderRadius.circular(6),
        ),
        child: isSelected
            ? const Icon(
                Icons.check_rounded,
                size: 16,
                color: AppColors.white,
              )
            : isOccupied
            ? const Icon(
                Icons.close_rounded,
                size: 16,
                color: AppColors.textColor50,
              )
            : Text(
                '${seat.number}',
                style: AppTypography.bodySemiboldXs.copyWith(
                  color: AppColors.overlayNavy,
                ),
              ),
      ),
    );
  }
}
