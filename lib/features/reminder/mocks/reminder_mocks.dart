import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';

class ReminderMocks {
  const ReminderMocks._();

  static const list = [
    ReminderModel(
      id: '1',
      title: 'Tagihan Baru: Biaya Daftar Ulang Tahunan',
      description:
          'Halo Bapak/Ibu, Tagihan Baru telah diterbitkan untuk tahun ajaran 2026/2027.',
      createdAtLabel: '10 Juli 2026 • 12:30 WIB',
      isRead: false,
    ),
    ReminderModel(
      id: '2',
      title: 'Pembayaran Berhasil Diverifikasi',
      description:
          'Pembayaran SPP Bulan Juli telah diverifikasi oleh pihak sekolah.',
      createdAtLabel: '09 Juli 2026 • 09:15 WIB',
      isRead: true,
    ),
    ReminderModel(
      id: '3',
      title: 'Pengingat: Batas Pembayaran',
      description:
          'Tagihan Biaya Pembangunan Gedung akan jatuh tempo dalam 3 hari.',
      createdAtLabel: '08 Juli 2026 • 16:45 WIB',
      isRead: false,
    ),
    ReminderModel(
      id: '4',
      title: 'Update Data Anak',
      description:
          'Data akademik Ahmad Zaki telah diperbarui. Silakan cek detail anak.',
      createdAtLabel: '07 Juli 2026 • 11:00 WIB',
      isRead: true,
    ),
    ReminderModel(
      id: '5',
      title: 'Tagihan Baru: SPP Bulan Agustus',
      description:
          'Halo Bapak/Ibu, Tagihan SPP Bulan Agustus telah diterbitkan.',
      createdAtLabel: '05 Juli 2026 • 08:20 WIB',
      isRead: true,
    ),
  ];
}
