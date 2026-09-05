import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderActiveBadge extends StatelessWidget {
  const WReminderActiveBadge({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.infoSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$count Aktif',
        style: AppTypography.bodySemiboldS.copyWith(
          color: AppColors.primaryPressed,
        ),
      ),
    );
  }
}
