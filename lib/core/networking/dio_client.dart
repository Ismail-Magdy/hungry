import 'package:dio/dio.dart';
import 'package:hungry_app/core/utils/pref_helpers.dart';

class DioClient {
  /// Base Url
  static const String baseUrl = "https://sonic-zdi0.onrender.com/api/";
  static const String contentTypeheader = "application/json";
  //
  final Dio _dio = Dio(
    //
    BaseOptions(
      baseUrl: DioClient.baseUrl,
      headers: {"Content_Type": DioClient.contentTypeheader},
    ),
    //
  );

  //

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken();
          if (token!.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
