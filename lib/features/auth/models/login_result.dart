class LoginUser {
  const LoginUser({
    required this.id,
    required this.nama,
    required this.username,
    required this.role,
  });

  final int id;
  final String nama;
  final String username;
  final String role;

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    final idValue = json['id'] ?? json['ID'];
    return LoginUser(
      id: idValue is num ? idValue.toInt() : int.tryParse('$idValue') ?? 0,
      nama: (json['nama'] ?? json['name'] ?? '').toString(),
      username: (json['username'] ?? json['email'] ?? '').toString(),
      role: (json['role'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nama': nama, 'username': username, 'role': role};
  }
}

class LoginResult {
  const LoginResult({required this.token, required this.user});

  final String token;
  final LoginUser user;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    if (userJson is! Map) {
      throw FormatException('Login response missing user');
    }

    return LoginResult(
      token:
          (json['token'] ?? json['access_token'] ?? json['accessToken'] ?? '')
              .toString(),
      user: LoginUser.fromJson(userJson.cast<String, dynamic>()),
    );
  }
}
