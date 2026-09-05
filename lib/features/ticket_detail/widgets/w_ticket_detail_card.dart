import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/ticket_detail_divider.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_booking_code.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_brand_badge.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_format_badge.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_info_box.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_movie_info.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_qr_section.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/resources/resources.dart';

class WTicketDetailCard extends StatelessWidget {
  const WTicketDetailCard({
    super.key,
    required this.image,
    required this.cinemaBrand,
    required this.studioLabel,
    required this.formatLabel,
    required this.ageRating,
    required this.duration,
    required this.title,
    required this.genres,
    required this.cinemaName,
    required this.dateLabel,
    required this.timeLabel,
    required this.seatCount,
    required this.seatsLabel,
    required this.bookingCode,
    required this.qrImage,
    required this.onTapCopyBookingCode,
  });

  final AssetGenImage image;
  final String cinemaBrand;
  final String studioLabel;
  final String formatLabel;
  final String ageRating;
  final String duration;
  final String title;
  final String genres;
  final String cinemaName;
  final String dateLabel;
  final String timeLabel;
  final int seatCount;
  final String seatsLabel;
  final String bookingCode;
  final AssetGenImage qrImage;
  final VoidCallback onTapCopyBookingCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.smooth,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              spacing: 14,
              children: [
                Row(
                  children: [
                    WTicketDetailBrandBadge(brand: cinemaBrand),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        studioLabel,
                        style: AppTypography.h10Bold.copyWith(
                          color: AppColors.overlayNavy,
                        ),
                      ),
                    ),
                    WTicketDetailFormatBadge(label: formatLabel),
                  ],
                ),
                WTicketDetailMovieInfo(
                  image: image,
                  ageRating: ageRating,
                  duration: duration,
                  title: title,
                  genres: genres,
                  cinemaName: cinemaName,
                ),
                IntrinsicHeight(
                  child: Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: WTicketDetailInfoBox(
                          label: 'Tanggal',
                          value: dateLabel,
                        ),
                      ),
                      Expanded(
                        child: WTicketDetailInfoBox(
                          label: 'Jam Tayang',
                          value: timeLabel,
                        ),
                      ),
                      Expanded(
                        child: WTicketDetailInfoBox(
                          label: 'Kursi ($seatCount)',
                          value: seatsLabel,
                          valueColor: AppColors.primaryDeep,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TicketDetailDivider(
            backgroundColor: AppColors.scaffoldBackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              spacing: 16,
              children: [
                WTicketDetailBookingCode(
                  bookingCode: bookingCode,
                  onTapCopyBookingCode: onTapCopyBookingCode,
                ),
                WTicketDetailQrSection(
                  qrImage: qrImage,
                  studioLabel: studioLabel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
