import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_label_promo.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WHomePromoCard extends StatelessWidget {
  const WHomePromoCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTapClaimPromo,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTapClaimPromo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryPressed,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          const WHomeLabelPromo(),
          Text(
            title,
            style: AppTypography.h8Bold.copyWith(color: AppColors.white),
          ),
          Text(
            description,
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.white.withValues(alpha: 0.85),
            ),
          ),
          PrimaryButton(text: buttonText, onPressed: onTapClaimPromo),
        ],
      ),
    );
  }
}
