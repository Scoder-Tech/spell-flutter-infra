import 'package:dio/dio.dart';

abstract class Failure {
  Failure._();

  factory Failure.failure(dynamic error) = DataFailure;

  String get code;

  dynamic get message;

  dynamic get response;
}

class DataFailure extends Failure {
  DataFailure(this.error) : super._();

  final dynamic error;

  @override
  String get code => error;

  @override
  dynamic get message => error;

  @override
  DioException get response => error;
}
