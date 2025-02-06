import 'package:dio/dio.dart';

import '../core/di/service_locator.dart';
import '../core/store/local_storage.dart';

class AuthRepository {
  final Dio _dio;
  final LocalStorage _storage;

  AuthRepository(this._dio) : _storage = getIt<LocalStorage>();

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      final token = response.data['token'];
      await _storage.saveToken(token);
      return token;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
      await _storage.clearToken();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}