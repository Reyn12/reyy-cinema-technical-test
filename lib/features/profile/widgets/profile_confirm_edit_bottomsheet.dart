import 'package:flutter/material.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ProfileConfirmEditBottomsheet extends StatelessWidget {
  const ProfileConfirmEditBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: const Icon(
                Icons.close,
                size: 24,
                color: AppColors.shadesPrimary50,
              ),
            ),
          ),
          const Icon(
            Icons.task_alt_rounded,
            size: 96,
            color: AppColors.primaryPressed,
          ),
          const SizedBox(height: 8),
          Text(
            'Pastikan Data Sesuai',
            textAlign: TextAlign.center,
            style: AppTypography.h8Bold.copyWith(
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Cek terlebih dahulu sebelum submit perubahan data kamu yaa!',
            textAlign: TextAlign.center,
            style: AppTypography.bodyRegularM.copyWith(
              color: AppColors.textColor50,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1, color: AppColors.neutral30),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Kembali',
                  reverse: true,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  text: 'Lanjutkan',
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
