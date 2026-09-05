import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WSeatSelectBottomBar extends StatelessWidget {
  const WSeatSelectBottomBar({
    super.key,
    required this.totalPaymentLabel,
    required this.enabled,
    required this.onPressed,
  });

  final String totalPaymentLabel;
  final bool enabled;
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.textColor50,
                    ),
                  ),
                  Text(
                    totalPaymentLabel,
                    style: AppTypography.h8Bold.copyWith(
                      color: AppColors.overlayNavy,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton.icon(
              onPressed: onPressed,
              enabled: enabled,
              color: AppColors.overlayNavy,
              width: 180,
              radiusValue: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Lanjut Pembayaran',
                    style: AppTypography.bodySemiboldS.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
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
