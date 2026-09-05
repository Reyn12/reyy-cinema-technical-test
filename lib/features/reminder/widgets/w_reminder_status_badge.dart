import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/reminder/models/film_reminder_item_model.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderStatusBadge extends StatelessWidget {
  const WReminderStatusBadge({
    super.key,
    required this.status,
  });

  final ReminderItemStatus status;

  @override
  Widget build(BuildContext context) {
    final isActive = status == ReminderItemStatus.active;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.success : AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? Icons.check_rounded : Icons.access_time_rounded,
            size: 12,
            color: isActive ? AppColors.white : AppColors.primaryPressed,
          ),
          const SizedBox(width: 4),
          Text(
            isActive ? 'Aktif' : 'Segera Hadir',
            style: AppTypography.bodySemiboldS.copyWith(
              color: isActive ? AppColors.white : AppColors.primaryPressed,
            ),
          ),
        ],
      ),
    );
  }
}
