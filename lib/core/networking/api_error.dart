class ApiError implements Exception {
  final int? statusCode;
  final String message;

  ApiError({this.statusCode, required this.message});

  String errorToString() {
    return "Error is $message and StatusCode is ${statusCode.toString()}";
  }
}
