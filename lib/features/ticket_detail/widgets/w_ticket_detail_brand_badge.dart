import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailBrandBadge extends StatelessWidget {
  const WTicketDetailBrandBadge({
    super.key,
    required this.brand,
  });

  final String brand;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.overlayNavy,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        brand,
        style: AppTypography.bodySemiboldXs.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
