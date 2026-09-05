import '../models/profile_model.dart';

class ProfileMocks {
  const ProfileMocks._();

  static ProfileModel get profile => const ProfileModel(
        id: 1,
        name: 'Muhammad Renaldi Maulana',
        username: 'reyy',
        email: 'muhammadrenaldi687@gmail.com',
        phone: '081234567890',
        avatarUrl: null,
        memberTier: 'premiere_gold',
        memberLabel: 'Member Premiere Gold',
        watchedCount: 12,
        reminderCount: 3,
        loyaltyPoint: 450,
      );
}
