import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WReminderCountdownBadge extends StatelessWidget {
  const WReminderCountdownBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.infoSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTypography.bodySemiboldS.copyWith(
          color: AppColors.primaryPressed,
        ),
      ),
    );
  }
}
