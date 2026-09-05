import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WBuyTicketBottomBar extends StatelessWidget {
  const WBuyTicketBottomBar({
    super.key,
    required this.cinemaStudioLabel,
    required this.scheduleLabel,
    required this.estimatedPriceLabel,
    required this.onPressed,
  });

  final String cinemaStudioLabel;
  final String scheduleLabel;
  final String estimatedPriceLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.smooth,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        cinemaStudioLabel,
                        style: AppTypography.bodyRegularS.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                      Text(
                        scheduleLabel,
                        style: AppTypography.bodySemiboldM.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 2,
                  children: [
                    Text(
                      'Estimasi',
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                    Text(
                      estimatedPriceLabel,
                      style: AppTypography.h9Bold.copyWith(
                        color: AppColors.primaryDeep,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PrimaryButton.icon(
              onPressed: onPressed,
              color: AppColors.overlayNavy,
              radiusValue: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pilih Kursi Bioskop',
                    style: AppTypography.bodySemiboldL.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
