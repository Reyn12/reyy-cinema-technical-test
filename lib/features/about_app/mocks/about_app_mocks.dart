import '../models/about_app_model.dart';

class AboutAppMocks {
  const AboutAppMocks._();

  static AboutAppModel get content => const AboutAppModel(
    appName: 'Reyy Cinema',
    version: '1.0.0',
    description:
        'Reyy Cinema adalah aplikasi bioskop untuk cari film, pilih bioskop, atur pengingat jadwal tonton, dan kelola tiket favoritmu dalam satu tempat.',
    contacts: [
      AboutAppContactModel(
        label: 'Email',
        value: 'muhammadrenaldi687@gmail.com',
      ),
      AboutAppContactModel(label: 'WhatsApp', value: '081319678220'),
    ],
  );
}
