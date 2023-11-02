import 'package:dio/dio.dart';

extension AuthRequestOptionsX on RequestOptions {
  void setAuthenticationHeader(String token) =>
      headers['Authorization'] = 'Bearer $token';
}
