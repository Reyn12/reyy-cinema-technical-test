import 'package:reyy_cinema/features/reminder/models/film_reminder_item_model.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';

class ReminderMocks {
  const ReminderMocks._();

  static List<FilmReminderItemModel> get list => [
        FilmReminderItemModel(
          id: 'reminder-1',
          image: Assets.images.imgDummyReminderItem1,
          title: 'Black Adam',
          genresDuration: 'Aksi, Fiksi Ilmiah • 2j 5m',
          scheduleLabel: 'Sabtu, 14 Okt 2026 • 19.30 WIB',
          locationLabel: 'Studio 1, XXI Solo Square',
          countdownLabel: '2 hari lagi',
          status: ReminderItemStatus.active,
          action: ReminderItemAction.viewTicket,
        ),
        FilmReminderItemModel(
          id: 'reminder-2',
          image: Assets.images.imgDummyReminderItem2,
          title: 'Avatar: The Way of Water',
          genresDuration: 'Petualangan, Sci-Fi • 3j 12m',
          scheduleLabel: 'Minggu, 22 Okt 2026 • 16.00 WIB',
          locationLabel: 'IMAX, The Park Solo',
          countdownLabel: '10 hari lagi',
          status: ReminderItemStatus.active,
          action: ReminderItemAction.changeSchedule,
        ),
        FilmReminderItemModel(
          id: 'reminder-3',
          image: Assets.images.imgDummyReminderItem3,
          title: 'Pengabdi Setan 2',
          genresDuration: 'Horor, Misteri • 1j 59m',
          scheduleLabel: 'Jumat, 28 Okt 2026 • 20.45 WIB',
          locationLabel: 'CGV Transmart Solo',
          countdownLabel: '16 hari lagi',
          status: ReminderItemStatus.comingSoon,
          action: ReminderItemAction.remindWhenReleased,
        ),
      ];
}
