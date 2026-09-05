import '../models/login_result.dart';

class AuthMocks {
  const AuthMocks._();

  static LoginResult login({
    required String username,
    required String password,
  }) {
    final resolvedUsername = username.isEmpty ? 'reyy' : username;

    return LoginResult(
      token: 'mock-token-$resolvedUsername',
      user: LoginUser(
        id: 1,
        name: 'Muhammad Renaldi Maulana',
        username: resolvedUsername,
        email: 'muhammadrenaldi687@gmail.com',
        phone: '081234567890',
        role: 'user',
        avatarUrl: null,
        memberTier: 'premiere_gold',
        memberLabel: 'Member Premiere Gold',
        watchedCount: 12,
        reminderCount: 3,
        loyaltyPoint: 450,
      ),
    );
  }
}
