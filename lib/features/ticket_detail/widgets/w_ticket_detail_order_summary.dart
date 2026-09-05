import 'package:flutter/material.dart';
import 'package:reyy_cinema/helper/format_currency_helper.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailOrderSummary extends StatelessWidget {
  const WTicketDetailOrderSummary({
    super.key,
    required this.orderNumber,
    required this.customerName,
    required this.paymentMethod,
    required this.transactionTime,
    required this.ticketCount,
    required this.totalPayment,
    this.statusLabel = 'Lunas',
  });

  final String orderNumber;
  final String customerName;
  final String paymentMethod;
  final String transactionTime;
  final int ticketCount;
  final int totalPayment;
  final String statusLabel;

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
            children: [
              Expanded(
                child: Text(
                  'Rincian Pemesanan',
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.successSurface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  statusLabel,
                  style: AppTypography.bodySemiboldS.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          Column(
            spacing: 10,
            children: [
              _OrderRow(label: 'Nomor Pesanan', value: orderNumber),
              _OrderRow(label: 'Nama Pemesan', value: customerName),
              _OrderRow(label: 'Metode Pembayaran', value: paymentMethod),
              _OrderRow(label: 'Waktu Transaksi', value: transactionTime),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primarySurfaceAlt,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total Pembayaran ($ticketCount Tiket)',
                    style: AppTypography.bodyRegularS.copyWith(
                      color: AppColors.overlayNavy,
                    ),
                  ),
                ),
                Text(
                  formatRupiah(totalPayment),
                  style: AppTypography.h9Bold.copyWith(
                    color: AppColors.overlayNavy,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderRow extends StatelessWidget {
  const _OrderRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyRegularS.copyWith(
              color: AppColors.textColor50,
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.bodySemiboldS.copyWith(
              color: AppColors.overlayNavy,
            ),
          ),
        ),
      ],
    );
  }
}
