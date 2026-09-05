import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WFilmDetailInfoCard extends StatelessWidget {
  const WFilmDetailInfoCard({
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor50,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodySemiboldS.copyWith(
              color: valueColor ?? AppColors.overlayNavy,
            ),
          ),
        ],
      ),
    );
  }
}
