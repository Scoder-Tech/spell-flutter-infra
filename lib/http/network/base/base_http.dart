import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseHttp {
  late Dio dio;
  final String baseUrl;

  BaseHttp({required this.baseUrl}) {
    dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      headers: {
        'Content-Type': 'application/json',
      },
      baseUrl: baseUrl,
    );
    if (kDebugMode) {
      dio.interceptors.addAll(
        [
          PrettyDioLogger(responseBody: true, compact: true),
          InterceptorsWrapper(onRequest: onRequest, onError: onError),
        ],
      );
    } else {
      dio.interceptors.add(
        InterceptorsWrapper(onRequest: onRequest, onError: onError),
      );
    }
  }

  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {}

  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {}
}
