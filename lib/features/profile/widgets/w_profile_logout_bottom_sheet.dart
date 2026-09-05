import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WProfileLogoutBottomSheet extends StatelessWidget {
  const WProfileLogoutBottomSheet({
    super.key,
    this.onConfirm,
  });

  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text(
            'Keluar dari Akun?',
            style: AppTypography.h8Bold.copyWith(
              color: AppColors.neutral100,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Kamu yakin ingin keluar? Kamu perlu login lagi untuk mengakses akun.',
            textAlign: TextAlign.center,
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.textColor50,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Batal',
                  reverse: true,
                  borderColor: Colors.transparent,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  text: 'Keluar',
                  color: AppColors.error,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    onConfirm?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
