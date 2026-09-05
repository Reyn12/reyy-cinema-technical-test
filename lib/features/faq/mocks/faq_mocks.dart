import '../models/faq_model.dart';

class FaqMocks {
  const FaqMocks._();

  static List<FaqItemModel> get list => const [
        FaqItemModel(
          id: '1',
          question: 'Bagaimana cara mengubah data profil saya?',
          answer:
              'Masuk ke aplikasi, buka menu Profil, lalu ketuk kartu profil untuk mengubah data pribadi kamu.',
        ),
        FaqItemModel(
          id: '2',
          question: 'Bagaimana cara reset password?',
          answer:
              'Di halaman login, ketuk "Lupa Password", lalu ikuti instruksi yang dikirim ke kontak terdaftar kamu.',
        ),
        FaqItemModel(
          id: '3',
          question: 'Bagaimana cara membeli tiket film?',
          answer:
              'Pilih film yang ingin ditonton, ketuk Beli Tiket, pilih tanggal dan jadwal, lalu lanjutkan ke pembayaran.',
        ),
        FaqItemModel(
          id: '4',
          question: 'Bagaimana cara menambahkan pengingat jadwal film?',
          answer:
              'Buka menu Reminder, lalu ketuk Tambah Pengingat dan pilih film serta jadwal yang ingin diingatkan.',
        ),
        FaqItemModel(
          id: '5',
          question: 'Siapa yang harus dihubungi jika ada kendala teknis?',
          answer:
              'Hubungi customer care Reyy Cinema via email support@reyycinema.id atau WhatsApp +62-812-0000-0000.',
        ),
        FaqItemModel(
          id: '6',
          question: 'Di mana saya bisa melihat tiket yang sudah dibeli?',
          answer:
              'Buka menu Reminder atau tiket aktif di profil untuk melihat daftar tiket dan jadwal tonton kamu.',
        ),
        FaqItemModel(
          id: '7',
          question: 'Apa yang harus dilakukan jika pembayaran tiket gagal?',
          answer:
              'Cek status transaksi kamu. Jika dana terpotong tapi tiket belum muncul, hubungi customer care Reyy Cinema.',
        ),
        FaqItemModel(
          id: '8',
          question: 'Bagaimana cara mencari bioskop terdekat?',
          answer:
              'Buka menu Bioskop, izinkan akses lokasi, lalu pilih bioskop yang tersedia di sekitar kamu.',
        ),
        FaqItemModel(
          id: '9',
          question: 'Apakah aplikasi bisa digunakan tanpa koneksi internet?',
          answer:
              'Tidak. Reyy Cinema membutuhkan koneksi internet untuk menampilkan film, jadwal, bioskop, dan tiket.',
        ),
        FaqItemModel(
          id: '10',
          question: 'Bagaimana jika ada perubahan syarat dan ketentuan?',
          answer:
              'Setiap pembaruan akan ditampilkan di menu Syarat dan Ketentuan. Dengan terus memakai aplikasi, kamu dianggap menyetujui ketentuan terbaru.',
        ),
      ];
}
