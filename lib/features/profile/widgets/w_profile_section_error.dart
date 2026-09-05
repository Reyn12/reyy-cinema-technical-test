import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WProfileSectionError extends StatelessWidget {
  const WProfileSectionError({
    super.key,
    this.onRetry,
    this.message = 'Gagal memuat profil',
  });

  final VoidCallback? onRetry;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppShadows.soft,
        ),
        child: Column(
          spacing: 12,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
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
