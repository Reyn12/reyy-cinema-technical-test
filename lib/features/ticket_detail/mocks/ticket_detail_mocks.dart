import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/ticket_detail/models/ticket_detail_model.dart';
import 'package:reyy_cinema/features/ticket_detail/widgets/w_ticket_detail_policy.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';

class TicketDetailMocks {
  const TicketDetailMocks._();

  static List<TicketDetailModel> get list => [
        TicketDetailModel(
          id: 'reminder-1',
          image: Assets.images.imgDumyDetailFilm,
          cinemaBrand: 'XXI',
          studioLabel: 'Studio 1',
          formatLabel: 'Reguler 2D',
          ageRating: 'D-17',
          duration: '2j 05m',
          title: 'Black Adam',
          genres: 'Aksi, Fantasi, Petualangan',
          cinemaName: 'XXI Solo Square',
          cinemaMapsQuery: 'XXI Solo Square',
          dateLabel: '14 Okt 2026',
          timeLabel: '19:30',
          seatCount: 2,
          seatsLabel: 'D5, D6',
          bookingCode: 'BK-XXI-98421099',
          qrImage: Assets.images.imgDummyQr,
          orderNumber: '#CR-20261014-8831',
          customerName: 'Muhammad Renaldi M.',
          paymentMethod: 'QRIS / GoPay',
          transactionTime: '12 Okt 2026, 14:20 WIB',
          ticketCount: 2,
          totalPayment: 93000,
          policies: const [
            TicketDetailPolicyItem(
              title: 'Lokasi Studio 1',
              description:
                  'Lantai 3 Solo Square Mall, sayap barat dekat area F&B XXI.',
              icon: Icons.meeting_room_outlined,
            ),
            TicketDetailPolicyItem(
              title: 'Hadir Lebih Awal',
              description:
                  'Pintu studio dibuka 15 menit sebelum waktu pemutaran (19:15 WIB).',
              icon: Icons.access_time_rounded,
            ),
            TicketDetailPolicyItem(
              title: 'Larangan Merekam',
              description:
                  'Dilarang keras mengambil video atau gambar selama pemutaran film berlangsung.',
              icon: Icons.no_photography_outlined,
            ),
          ],
        ),
        TicketDetailModel(
          id: 'reminder-2',
          image: Assets.images.imgDummyReminderItem2,
          cinemaBrand: 'XXI',
          studioLabel: 'IMAX',
          formatLabel: 'IMAX 2D',
          ageRating: '13+',
          duration: '3j 12m',
          title: 'Avatar: The Way of Water',
          genres: 'Petualangan, Sci-Fi',
          cinemaName: 'The Park Solo',
          cinemaMapsQuery: 'Cinema XXI The Park Solo',
          dateLabel: '22 Okt 2026',
          timeLabel: '16:00',
          seatCount: 1,
          seatsLabel: 'C4',
          bookingCode: 'BK-XXI-77219844',
          qrImage: Assets.images.imgDummyQr,
          orderNumber: '#CR-20261022-4412',
          customerName: 'Muhammad Renaldi M.',
          paymentMethod: 'QRIS / GoPay',
          transactionTime: '18 Okt 2026, 10:05 WIB',
          ticketCount: 1,
          totalPayment: 68000,
          policies: const [
            TicketDetailPolicyItem(
              title: 'Lokasi IMAX',
              description: 'Lantai 2 The Park Mall, area bioskop XXI.',
              icon: Icons.meeting_room_outlined,
            ),
            TicketDetailPolicyItem(
              title: 'Hadir Lebih Awal',
              description:
                  'Pintu studio dibuka 15 menit sebelum waktu pemutaran.',
              icon: Icons.access_time_rounded,
            ),
            TicketDetailPolicyItem(
              title: 'Larangan Merekam',
              description:
                  'Dilarang keras mengambil video atau gambar selama pemutaran film berlangsung.',
              icon: Icons.no_photography_outlined,
            ),
          ],
        ),
      ];

  static TicketDetailModel byId(String id) {
    return list.firstWhere(
      (ticket) => ticket.id == id,
      orElse: () => list.first,
    );
  }
}
