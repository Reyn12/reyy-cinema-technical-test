import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_policy.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';

class TicketDetailModel {
  const TicketDetailModel({
    required this.id,
    required this.image,
    required this.cinemaBrand,
    required this.studioLabel,
    required this.formatLabel,
    required this.ageRating,
    required this.duration,
    required this.title,
    required this.genres,
    required this.cinemaName,
    required this.cinemaMapsQuery,
    required this.dateLabel,
    required this.timeLabel,
    required this.seatCount,
    required this.seatsLabel,
    required this.bookingCode,
    required this.qrImage,
    required this.orderNumber,
    required this.customerName,
    required this.paymentMethod,
    required this.transactionTime,
    required this.ticketCount,
    required this.totalPayment,
    required this.policies,
    this.statusLabel = 'Lunas',
  });

  final String id;
  final AssetGenImage image;
  final String cinemaBrand;
  final String studioLabel;
  final String formatLabel;
  final String ageRating;
  final String duration;
  final String title;
  final String genres;
  final String cinemaName;
  final String cinemaMapsQuery;
  final String dateLabel;
  final String timeLabel;
  final int seatCount;
  final String seatsLabel;
  final String bookingCode;
  final AssetGenImage qrImage;
  final String orderNumber;
  final String customerName;
  final String paymentMethod;
  final String transactionTime;
  final int ticketCount;
  final int totalPayment;
  final String statusLabel;
  final List<TicketDetailPolicyItem> policies;

  factory TicketDetailModel.fromJson(Map<String, dynamic> json) {
    final policiesJson = json['policies'];
    final imageIndex = json['image_index'] is num
        ? (json['image_index'] as num).toInt()
        : int.tryParse('${json['image_index'] ?? 0}') ?? 0;

    return TicketDetailModel(
      id: (json['id'] ?? '').toString(),
      image: _posterByIndex(imageIndex),
      cinemaBrand: (json['cinema_brand'] ?? json['cinemaBrand'] ?? '').toString(),
      studioLabel: (json['studio_label'] ?? json['studioLabel'] ?? '').toString(),
      formatLabel: (json['format_label'] ?? json['formatLabel'] ?? '').toString(),
      ageRating: (json['age_rating'] ?? json['ageRating'] ?? '').toString(),
      duration: (json['duration'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      genres: (json['genres'] ?? '').toString(),
      cinemaName: (json['cinema_name'] ?? json['cinemaName'] ?? '').toString(),
      cinemaMapsQuery:
          (json['cinema_maps_query'] ?? json['cinemaMapsQuery'] ?? '').toString(),
      dateLabel: (json['date_label'] ?? json['dateLabel'] ?? '').toString(),
      timeLabel: (json['time_label'] ?? json['timeLabel'] ?? '').toString(),
      seatCount: _toInt(json['seat_count'] ?? json['seatCount']),
      seatsLabel: (json['seats_label'] ?? json['seatsLabel'] ?? '').toString(),
      bookingCode:
          (json['booking_code'] ?? json['bookingCode'] ?? '').toString(),
      qrImage: Assets.images.imgDummyQr,
      orderNumber:
          (json['order_number'] ?? json['orderNumber'] ?? '').toString(),
      customerName:
          (json['customer_name'] ?? json['customerName'] ?? '').toString(),
      paymentMethod:
          (json['payment_method'] ?? json['paymentMethod'] ?? '').toString(),
      transactionTime:
          (json['transaction_time'] ?? json['transactionTime'] ?? '').toString(),
      ticketCount: _toInt(json['ticket_count'] ?? json['ticketCount']),
      totalPayment: _toInt(json['total_payment'] ?? json['totalPayment']),
      statusLabel: (json['status_label'] ?? json['statusLabel'] ?? 'Lunas')
          .toString(),
      policies: policiesJson is List
          ? policiesJson
                .map(
                  (item) => _policyFromJson(
                    (item as Map).cast<String, dynamic>(),
                  ),
                )
                .toList()
          : const [],
    );
  }

  static int _toInt(dynamic value) {
    if (value is num) return value.toInt();
    return int.tryParse('$value') ?? 0;
  }

  static AssetGenImage _posterByIndex(int index) {
    final images = [
      Assets.images.imgDumyDetailFilm,
      Assets.images.imgDummyReminderItem1,
      Assets.images.imgDummyReminderItem2,
    ];
    return images[index % images.length];
  }

  static TicketDetailPolicyItem _policyFromJson(Map<String, dynamic> json) {
    final iconKey = (json['icon'] ?? 'policy').toString();
    return TicketDetailPolicyItem(
      title: (json['title'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      icon: switch (iconKey) {
        'room' || 'meeting_room' => Icons.meeting_room_outlined,
        'time' || 'access_time' => Icons.access_time_rounded,
        'no_photo' || 'no_photography' => Icons.no_photography_outlined,
        _ => Icons.info_outline_rounded,
      },
    );
  }
}
