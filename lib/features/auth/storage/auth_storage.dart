import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_result.dart';

class AuthStorage {
  AuthStorage({
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  static const String tokenKey = 'auth_token';
  static const String userKey = 'auth_user';

  Future<void> saveLogin(LoginResult login) async {
    debugPrint('┌──────────────── AuthStorage.saveLogin ────────────────');
    debugPrint('│ Start simpan data login');
    debugPrint('│ Token preview: ${login.token}');
    debugPrint('│ User id: ${login.user.id}');
    try {
      await _secureStorage.write(
        key: tokenKey,
        value: login.token,
      );
      debugPrint('│ Token tersimpan di secure storage');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(userKey, jsonEncode(login.user.toJson()));
      
      debugPrint('│ User tersimpan di shared preferences');
      debugPrint('└──────────────── Save login sukses ───────────────────');
    } catch (e, st) {
      debugPrint('│ ERROR saveLogin: $e');
      debugPrint('$st');
      debugPrint('└──────────────── Save login gagal ────────────────────');
      rethrow;
    }
  }

  Future<String?> getToken() async {
    return _secureStorage.read(key: tokenKey);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<LoginUser?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(userKey);
    if (raw == null || raw.isEmpty) return null;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return LoginUser.fromJson(decoded.cast<String, dynamic>());
    } catch (_) {
      return null;
    }
  }

  Future<void> clearLogin() async {
    await _secureStorage.delete(key: tokenKey);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}

