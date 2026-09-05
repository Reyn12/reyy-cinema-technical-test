import 'package:flutter/material.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailBookingCode extends StatelessWidget {
  const WTicketDetailBookingCode({
    super.key,
    required this.bookingCode,
    required this.onTapCopyBookingCode,
  });

  final String bookingCode;
  final VoidCallback onTapCopyBookingCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'KODE BOOKING MASUK',
          style: AppTypography.bodySemiboldXs.copyWith(
            color: AppColors.textColor50,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                bookingCode,
                style: AppTypography.h8Bold.copyWith(
                  color: AppColors.overlayNavy,
                ),
              ),
            ),
            GestureDetector(
              onTap: onTapCopyBookingCode,
              child: Assets.icons.icCopy.svg(width: 16, height: 20),
            ),
          ],
        ),
      ],
    );
  }
}
