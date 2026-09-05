import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WBioskopMapEtaBanner extends StatelessWidget {
  const WBioskopMapEtaBanner({
    super.key,
    required this.etaMinutes,
  });

  final int etaMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: AppShadows.soft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Estimasi Waktu di $etaMinutes Menit Sampai',
              textAlign: TextAlign.center,
              style: AppTypography.bodySemiboldS.copyWith(
                color: AppColors.neutral100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
