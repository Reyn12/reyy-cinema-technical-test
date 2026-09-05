import '../models/login_result.dart';

class AuthMocks {
  const AuthMocks._();

  static LoginResult login({
    required String username,
    required String password,
  }) {
    return LoginResult(
      token: 'mock-token-${username.isEmpty ? 'guest' : username}',
      user: LoginUser(
        id: 1,
        nama: 'Parent Ziad',
        username: username.isEmpty ? 'parent' : username,
        role: 'parent',
      ),
    );
  }
}
