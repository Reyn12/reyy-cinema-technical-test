import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailFormatBadge extends StatelessWidget {
  const WTicketDetailFormatBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.primarySurfaceAlt,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTypography.bodySemiboldXs.copyWith(
          color: AppColors.primaryDeep,
        ),
      ),
    );
  }
}
