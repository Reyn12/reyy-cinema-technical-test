import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class TermsSectionError extends StatelessWidget {
  const TermsSectionError({
    super.key,
    this.onRetry,
    this.message = 'Gagal memuat data',
  });

  final VoidCallback? onRetry;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.neutral10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          spacing: 12,
          children: [
            Text(
              message,
              style: AppTypography.bodyRegularS.copyWith(
                color: AppColors.neutral100,
              ),
            ),
            if (onRetry != null)
              PrimaryButton(
                text: 'Coba Lagi',
                onPressed: onRetry!,
                height: 40,
              ),
          ],
        ),
      ),
    );
  }
}
