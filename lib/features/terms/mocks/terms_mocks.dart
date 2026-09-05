import '../models/terms_model.dart';

class TermsMocks {
  const TermsMocks._();

  static TermsModel get content => const TermsModel(
        htmlContent: '''
<p>Dokumen ini adalah syarat dan ketentuan pemakaian aplikasi Reyy Cinema. Dengan masuk dan memakai aplikasi, kamu menyetujui ketentuan di bawah ini.</p>
<ol>
  <li><strong>Ketentuan Akun</strong>
    <ul>
      <li>Jaga kerahasiaan akun dan password kamu sendiri.</li>
      <li>Segala aktivitas di akun kamu adalah tanggung jawab kamu sepenuhnya.</li>
    </ul>
  </li>
  <li><strong>Film &amp; Bioskop</strong>
    <ul>
      <li>Informasi film, jadwal, dan bioskop dapat berubah sewaktu-waktu sesuai data mitra bioskop.</li>
      <li>Pengingat jadwal bersifat bantuan notifikasi dan tidak menjamin ketersediaan tiket.</li>
    </ul>
  </li>
  <li><strong>Penggunaan Aplikasi</strong>
    <ul>
      <li>Gunakan aplikasi hanya untuk keperluan pencarian film, bioskop, dan pengingat jadwal.</li>
      <li>Dilarang menyalahgunakan fitur aplikasi untuk kepentingan yang melanggar hukum.</li>
      <li>Konten, data, dan layanan di dalam aplikasi dapat berubah sewaktu-waktu sesuai kebijakan Reyy Cinema.</li>
    </ul>
  </li>
  <li><strong>Privasi &amp; Data</strong>
    <ul>
      <li>Data pribadi kamu digunakan untuk keperluan layanan aplikasi.</li>
      <li>Kami berkomitmen menjaga keamanan data sesuai kebijakan privasi yang berlaku.</li>
      <li>Kamu bertanggung jawab atas kebenaran data yang kamu input di aplikasi.</li>
    </ul>
  </li>
  <li><strong>Ketersediaan Layanan</strong>
    <ul>
      <li>Aplikasi dapat mengalami gangguan, pemeliharaan, atau pembaruan sewaktu-waktu.</li>
      <li>Reyy Cinema berhak menonaktifkan fitur tertentu bila diperlukan untuk keamanan atau operasional.</li>
    </ul>
  </li>
  <li><strong>Perubahan Ketentuan</strong>
    <ul>
      <li>Syarat dan ketentuan ini dapat diperbarui tanpa pemberitahuan sebelumnya.</li>
      <li>Dengan terus menggunakan aplikasi, kamu dianggap menyetujui versi ketentuan terbaru.</li>
    </ul>
  </li>
</ol>
''',
      );
}
