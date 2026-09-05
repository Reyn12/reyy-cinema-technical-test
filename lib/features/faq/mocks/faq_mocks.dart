import '../models/faq_model.dart';

class FaqMocks {
  const FaqMocks._();

  static List<FaqItemModel> get list => const [
        FaqItemModel(
          id: '1',
          question: 'Bagaimana cara mengubah data pribadi saya?',
          answer:
              'Masuk ke aplikasi, buka menu Profil, lalu ketuk kartu profil untuk mengubah data pribadi.',
        ),
        FaqItemModel(
          id: '2',
          question: 'Bagaimana cara reset password?',
          answer:
              'Di halaman login, ketuk "Lupa Password", lalu ikuti instruksi yang dikirim ke kontak terdaftar kamu.',
        ),
        FaqItemModel(
          id: '3',
          question: 'Bagaimana cara melihat tagihan anak?',
          answer:
              'Buka menu Tagihan di beranda atau navigasi bawah untuk melihat daftar tagihan yang belum dan sudah dibayar.',
        ),
        FaqItemModel(
          id: '4',
          question: 'Bagaimana cara melakukan pembayaran?',
          answer:
              'Pilih tagihan yang ingin dibayar, ikuti langkah pembayaran, lalu unggah bukti transfer jika diminta.',
        ),
        FaqItemModel(
          id: '5',
          question: 'Siapa yang harus dihubungi jika ada kendala teknis?',
          answer:
              'Hubungi customer care Ziad Pay via email support@ziadpay.id atau WhatsApp +62-812-0000-0000.',
        ),
        FaqItemModel(
          id: '6',
          question: 'Di mana saya bisa melihat riwayat pembayaran?',
          answer:
              'Buka menu Pembayaran untuk melihat riwayat dan status transaksi kamu.',
        ),
        FaqItemModel(
          id: '7',
          question: 'Apa yang harus dilakukan jika pembayaran belum terverifikasi?',
          answer:
              'Pastikan bukti transfer sudah diunggah dengan benar. Jika masih pending, hubungi pihak sekolah atau customer care Ziad Pay.',
        ),
        FaqItemModel(
          id: '8',
          question: 'Bagaimana cara menambah data anak?',
          answer:
              'Buka menu Anak, lalu ikuti instruksi untuk menambahkan atau melihat detail anak yang terhubung ke akun kamu.',
        ),
        FaqItemModel(
          id: '9',
          question: 'Apakah aplikasi bisa digunakan tanpa koneksi internet?',
          answer:
              'Tidak. Ziad Pay membutuhkan koneksi internet untuk menampilkan tagihan, pembayaran, dan data anak.',
        ),
        FaqItemModel(
          id: '10',
          question: 'Bagaimana jika ada perubahan syarat dan ketentuan?',
          answer:
              'Setiap pembaruan akan ditampilkan di menu Syarat dan Ketentuan. Dengan terus memakai aplikasi, kamu dianggap menyetujui ketentuan terbaru.',
        ),
      ];
}
