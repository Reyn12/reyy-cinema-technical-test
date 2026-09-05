import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_cinema_model.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_schedules_result.dart';

class BuyTicketMocks {
  const BuyTicketMocks._();

  static const formats = ['Semua Format', 'XXI', 'CGV', 'Cinépolis', 'IMAX'];

  static const filmFormats = ['Dolby Atmos', 'IMAX 2D'];

  static BuyTicketSchedulesResult schedulesForDate(DateTime date) {
    final isWeekend =
        date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
    final list = isWeekend
        ? cinemas.where((cinema) => cinema.brand != 'CGV').toList()
        : cinemas;

    return BuyTicketSchedulesResult(
      formats: formats,
      filmFormats: filmFormats,
      cinemas: list,
    );
  }

  static List<BuyTicketCinemaModel> get cinemas => const [
    BuyTicketCinemaModel(
      id: 'cinema-1',
      name: 'XXI Solo Square',
      brand: 'XXI',
      distanceLabel: '1.8 km',
      address: 'Jl. Slamet Riyadi, Laweyan',
      isFavorite: false,
      studios: [
        BuyTicketStudioModel(
          id: 'studio-1a',
          name: 'Reguler 2D',
          price: 45000,
          slots: [
            BuyTicketTimeSlotModel(id: 'slot-1a-1', time: '13:00'),
            BuyTicketTimeSlotModel(id: 'slot-1a-2', time: '15:45'),
            BuyTicketTimeSlotModel(id: 'slot-1a-3', time: '18:30'),
            BuyTicketTimeSlotModel(id: 'slot-1a-4', time: '21:15'),
          ],
        ),
        BuyTicketStudioModel(
          id: 'studio-1b',
          name: 'The Premiere',
          price: 85000,
          badge: 'Lounge VIP',
          badgeType: BuyTicketBadgeType.loungeVip,
          slots: [
            BuyTicketTimeSlotModel(id: 'slot-1b-1', time: '14:15'),
            BuyTicketTimeSlotModel(id: 'slot-1b-2', time: '17:00'),
            BuyTicketTimeSlotModel(id: 'slot-1b-3', time: '19:45'),
            BuyTicketTimeSlotModel(
              id: 'slot-1b-4',
              time: '22:30',
              status: BuyTicketSlotStatus.soldOut,
            ),
          ],
        ),
      ],
    ),
    BuyTicketCinemaModel(
      id: 'cinema-2',
      name: 'Cinema XXI The Park',
      brand: 'XXI',
      distanceLabel: '4.9 km',
      address: 'Solo Baru, Sukoharjo',
      isFavorite: false,
      studios: [
        BuyTicketStudioModel(
          id: 'studio-2a',
          name: 'IMAX with Laser 2D',
          price: 65000,
          badge: 'Ultimate',
          badgeType: BuyTicketBadgeType.ultimate,
          slots: [
            BuyTicketTimeSlotModel(id: 'slot-2a-1', time: '13:30'),
            BuyTicketTimeSlotModel(id: 'slot-2a-2', time: '16:15'),
            BuyTicketTimeSlotModel(id: 'slot-2a-3', time: '19:00'),
            BuyTicketTimeSlotModel(id: 'slot-2a-4', time: '21:45'),
          ],
        ),
        BuyTicketStudioModel(
          id: 'studio-2b',
          name: 'Reguler 2D',
          price: 45000,
          slots: [
            BuyTicketTimeSlotModel(id: 'slot-2b-1', time: '12:45'),
            BuyTicketTimeSlotModel(id: 'slot-2b-2', time: '15:15'),
            BuyTicketTimeSlotModel(id: 'slot-2b-3', time: '18:00'),
            BuyTicketTimeSlotModel(
              id: 'slot-2b-4',
              time: '20:30',
              status: BuyTicketSlotStatus.full,
            ),
          ],
        ),
      ],
    ),
    BuyTicketCinemaModel(
      id: 'cinema-3',
      name: 'CGV Solo Paragon',
      brand: 'CGV',
      distanceLabel: '3.2 km',
      address: 'Jl. Yosodipuro, Solo',
      isFavorite: true,
      studios: [
        BuyTicketStudioModel(
          id: 'studio-3a',
          name: 'Regular 2D',
          price: 45000,
          slots: [
            BuyTicketTimeSlotModel(id: 'slot-3a-1', time: '14:00'),
            BuyTicketTimeSlotModel(id: 'slot-3a-2', time: '16:40'),
            BuyTicketTimeSlotModel(id: 'slot-3a-3', time: '19:20'),
            BuyTicketTimeSlotModel(id: 'slot-3a-4', time: '22:00'),
          ],
        ),
      ],
    ),
  ];
}
