import 'package:flutter/material.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class WHomeLatestBillCard extends StatelessWidget {
  const WHomeLatestBillCard({
    super.key,
    required this.title,
    required this.amount,
    required this.onTapPayNow,
  });

  final String title;
  final int amount;
  final VoidCallback onTapPayNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  const Icon(
                    Icons.confirmation_number_rounded,
                    size: 24,
                    color: AppColors.primaryPressed,
                  ),
                  Text(
                    'Tagihan Terbaru',
                    style: AppTypography.bodySemiboldM.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEB4B0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Belum Lunas',
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: const Color(0xFFCB3A31),
                  ),
                ),
              ),
            ],
          ),
          Column(
            spacing: 4,
            children: [
              Text(
                title,
                style: AppTypography.bodyRegularS.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                formatRupiah(amount),
                style: AppTypography.h9Bold.copyWith(color: Colors.black),
              ),
            ],
          ),
          PrimaryButton(
            text: 'Bayar Sekarang',
            color: AppColors.primaryPressed,
            onPressed: onTapPayNow,
          ),
        ],
      ),
    );
  }
}
