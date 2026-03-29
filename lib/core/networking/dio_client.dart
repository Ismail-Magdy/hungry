import 'package:dio/dio.dart';

import '../utils/pref_helpers.dart';

class DioClient {
  static const String baseUrl = "https://sonic-zdi0.onrender.com/api/";
  static const String contentTypeHeader = "application/json";

  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {"Content-Type": contentTypeHeader},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
