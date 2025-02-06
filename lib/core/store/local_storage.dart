// lib/core/storage/local_storage.dart

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class LocalStorageImpl implements LocalStorage {
  static const String _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> getToken()async {
    final prefs =  SharedPreferences.getInstance();
    return prefs.then((prefs) => prefs.getString(_tokenKey));
  }

  @override
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}