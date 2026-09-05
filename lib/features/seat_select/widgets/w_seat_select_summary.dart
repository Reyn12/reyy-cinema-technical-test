import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WSeatSelectSummary extends StatelessWidget {
  const WSeatSelectSummary({
    super.key,
    required this.selectedSeatsLabel,
    required this.ticketCountLabel,
    required this.ticketsPriceDetailLabel,
    required this.ticketsSubtotalLabel,
    required this.serviceFeeLabel,
    required this.isReminderEnabled,
    required this.onReminderChanged,
  });

  final String selectedSeatsLabel;
  final String ticketCountLabel;
  final String ticketsPriceDetailLabel;
  final String ticketsSubtotalLabel;
  final String serviceFeeLabel;
  final bool isReminderEnabled;
  final ValueChanged<bool> onReminderChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.smooth,
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'KURSI TERPILIH',
                      style: AppTypography.bodySemiboldXs.copyWith(
                        color: AppColors.primaryDeep,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      selectedSeatsLabel,
                      style: AppTypography.h9Bold.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primarySurfaceAlt,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icons.icSeat.svg(width: 12, height: 12),
                    const SizedBox(width: 4),
                    Text(
                      ticketCountLabel,
                      style: AppTypography.bodySemiboldS.copyWith(
                        color: AppColors.overlayNavy,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            spacing: 8,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      ticketsPriceDetailLabel,
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                  ),
                  Text(
                    ticketsSubtotalLabel,
                    style: AppTypography.bodySemiboldS.copyWith(
                      color: AppColors.overlayNavy,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Biaya Layanan Aplikasi',
                      style: AppTypography.bodyRegularS.copyWith(
                        color: AppColors.textColor50,
                      ),
                    ),
                  ),
                  Text(
                    serviceFeeLabel,
                    style: AppTypography.bodySemiboldS.copyWith(
                      color: AppColors.overlayNavy,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Assets.icons.icNotifSelectedSeat.svg(width: 28, height: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingatkan 1 Jam Sebelum',
                        style: AppTypography.bodySemiboldS.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                      Text(
                        'Sinkron ke kalender otomatis',
                        style: AppTypography.bodyRegularXs.copyWith(
                          color: AppColors.textColor50,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isReminderEnabled,
                  onChanged: onReminderChanged,
                  activeThumbColor: AppColors.white,
                  activeTrackColor: AppColors.overlayNavy,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: AppColors.neutral50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
