import 'package:dio/dio.dart';
import 'package:hungry_app/core/networking/api_excepsions.dart';
import 'package:hungry_app/core/networking/dio_client.dart';

class ApiServices {
  final DioClient _dioClient;

  //   Dependency Injection
  ApiServices({required DioClient dioClient}) : _dioClient = dioClient;

  /// GET
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (error) {
      throw ApiExceptions.handleError(error);
    }
  }

  /// POST
  Future<dynamic> post(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw ApiExceptions.handleError(error);
    }
  }

  /// UPDATE || PUT
  Future<dynamic> update(String endPoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw ApiExceptions.handleError(error);
    }
  }

  /// DELETE
  Future<dynamic> delete(String endPoint, Map<String, dynamic>? body) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (error) {
      throw ApiExceptions.handleError(error);
    }
  }
}
