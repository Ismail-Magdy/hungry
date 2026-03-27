import 'package:dio/dio.dart';
import 'package:hungry_app/core/networking/api_error.dart';

class ApiExcepsions {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Bad Connection");
      case DioExceptionType.badCertificate:
        return ApiError(message: "Bad Certificate");
      case DioExceptionType.badResponse:
        return ApiError(message: "Bad Response");
      case DioExceptionType.cancel:
        return ApiError(message: "Cancel");
      case DioExceptionType.connectionError:
        return ApiError(message: "Bad Connection Error");
      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive Timeout");
      case DioExceptionType.sendTimeout:
        return ApiError(message: "send Timeout");
      case DioExceptionType.unknown:
        return ApiError(message: "Unknown Error , Please Try Again");
    }
  }
}
