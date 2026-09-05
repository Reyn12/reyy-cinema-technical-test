import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WHomeLabelPromo extends StatelessWidget {
  const WHomeLabelPromo({
    super.key,
    this.label = 'PROMO',
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.icPromo.svg(width: 10, height: 12),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.h11Bold.copyWith(
              color: AppColors.white,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
