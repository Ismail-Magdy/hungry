import 'package:dio/dio.dart';
import 'package:hungry_app/core/networking/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection Timeout");
      case DioExceptionType.badCertificate:
        return ApiError(message: "Bad Certificate");
      case DioExceptionType.badResponse:
        return ApiError(
          statusCode: error.response?.statusCode,
          message: error.response?.data['message'] ?? "Bad Response",
        );
      case DioExceptionType.cancel:
        return ApiError(message: "Request Canceled");
      case DioExceptionType.connectionError:
        return ApiError(message: "No Internet Connection");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive Timeout");
      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send Timeout");
      case DioExceptionType.unknown:
        return ApiError(message: "Unknown Error, Please Try Again");
    }
  }
}
