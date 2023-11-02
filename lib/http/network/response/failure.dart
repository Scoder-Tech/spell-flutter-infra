import 'package:dio/dio.dart';

import '../network.dart';

abstract class Failure {
  Failure._();

  factory Failure.dioFailure(DioException error) = DioFailure;
  factory Failure.dataFailure(ErrorResponse error) = DataFailure;
  factory Failure.unknownFailure(TypeError error) = UnknownFailure;

  String get code;

  ErrorResponse get message;

  dynamic get response;
}

class DioFailure extends Failure {
  DioFailure(this.error) : super._();

  final DioException error;

  @override
  String get code => error.response?.statusCode.toString() ?? '';

  @override
  ErrorResponse get message => ErrorResponse.fromJson(error.response?.data);

  @override
  dynamic get response => error.response;
}

class DataFailure extends Failure {
  DataFailure(this.error) : super._();

  final ErrorResponse error;

  @override
  String get code => error.friendlyMessage ?? '';

  @override
  ErrorResponse get message => ErrorResponse(
        friendlyMessage: error.friendlyMessage,
        error: error.error,
        statusCode: error.statusCode,
      );

  @override
  dynamic get response => error.friendlyMessage;
}

class UnknownFailure extends Failure {
  UnknownFailure(this.error) : super._();

  final TypeError error;

  @override
  String get code => error.hashCode.toString();

  @override
  ErrorResponse get message => ErrorResponse(
        friendlyMessage: error.toString(),
      );

  @override
  dynamic get response => error;
}
