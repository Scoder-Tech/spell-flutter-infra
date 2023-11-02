class ApiResponse {
  ApiResponse({
    this.data,
    this.list,
    this.errors,
  });

  final Map<String, dynamic>? data;
  final List<dynamic>? list;
  final ErrorResponse? errors;

  factory ApiResponse.fromJson(dynamic json) {
    if (json is List) {
      return ApiResponse(
        list: json,
      );
    } else if (json is Map) {
      return ApiResponse(
        data: Map<String, dynamic>.from(json),
        errors: ErrorResponse.fromJson(Map<String, dynamic>.from(json)),
      );
    } else {
      return ApiResponse(data: {});
    }
  }
}

class ErrorResponse {
  int? statusCode;
  String? error;
  String? friendlyMessage;

  ErrorResponse({
    this.statusCode,
    this.error,
    this.friendlyMessage,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        statusCode: json['statusCode'],
        error: json['error'],
        friendlyMessage: json['friendlyMessage'],
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'error': error,
        'friendlyMessage': friendlyMessage,
      };
}
