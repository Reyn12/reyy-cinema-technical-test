import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailMapsButton extends StatelessWidget {
  const WTicketDetailMapsButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.neutral40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icRoadmap.svg(width: 17, height: 17),
            const SizedBox(width: 8),
            Text(
              'Petunjuk Arah Bioskop (Buka Maps)',
              style: AppTypography.bodySemiboldM.copyWith(
                color: AppColors.overlayNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
