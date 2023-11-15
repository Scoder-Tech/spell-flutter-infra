import 'package:dio/dio.dart';

abstract class Failure {
  Failure._();

  factory Failure.dioFailure(DioException error) = DioFailure;
  factory Failure.dataFailure(dynamic error) = DataFailure;
  factory Failure.unknownFailure(TypeError error) = UnknownFailure;

  String get code;

  dynamic get message;

  dynamic get response;
}

class DioFailure extends Failure {
  DioFailure(this.error) : super._();

  final DioException error;

  @override
  String get code => error.response?.statusCode.toString() ?? '';

  @override
  dynamic get message => error;

  @override
  dynamic get response => error.response;
}

class DataFailure extends Failure {
  DataFailure(this.error) : super._();

  final dynamic error;

  @override
  String get code => error;

  @override
  dynamic get message => error;

  @override
  dynamic get response => error;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.error) : super._();

  final TypeError error;

  @override
  String get code => error.hashCode.toString();

  @override
  dynamic get message => error;

  @override
  dynamic get response => error;
}
