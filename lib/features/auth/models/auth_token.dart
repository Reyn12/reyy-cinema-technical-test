class AuthToken {
  const AuthToken({
    required this.token,
    this.refreshToken,
  });

  final String token;
  final String? refreshToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    final tokenValue = json['token'] ?? json['access_token'] ?? json['accessToken'];
    final refreshValue = json['refresh_token'] ?? json['refreshToken'];

    return AuthToken(
      token: tokenValue?.toString() ?? '',
      refreshToken: refreshValue?.toString(),
    );
  }
}

