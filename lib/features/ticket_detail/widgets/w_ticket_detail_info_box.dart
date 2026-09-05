import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailInfoBox extends StatelessWidget {
  const WTicketDetailInfoBox({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primarySurfaceAlt,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2,
        children: [
          Text(
            label,
            style: AppTypography.bodyRegularXs.copyWith(
              color: AppColors.textColor50,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodySemiboldS.copyWith(
              color: valueColor ?? AppColors.overlayNavy,
            ),
          ),
        ],
      ),
    );
  }
}
