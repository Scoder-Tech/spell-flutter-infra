class ApiResponse {
  ApiResponse({
    this.data,
    this.list,
    this.errors,
  });

  final Map<String, dynamic>? data;
  final List<dynamic>? list;
  final dynamic errors;

  factory ApiResponse.fromJson(dynamic json) {
    if (json is List) {
      return ApiResponse(
        list: json,
      );
    } else if (json is Map) {
      return ApiResponse(
        data: Map<String, dynamic>.from(json),
        errors: json,
      );
    } else {
      return ApiResponse(data: {});
    }
  }
}
