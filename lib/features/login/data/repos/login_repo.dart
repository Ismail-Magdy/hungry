import 'package:hungry_app/core/constants/api_end_points.dart';
import 'package:hungry_app/core/networking/api_error.dart';
import 'package:hungry_app/core/networking/api_services.dart';
import 'package:hungry_app/features/login/data/models/login_request_model.dart';
import 'package:hungry_app/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiServices _apiServices;

  LoginRepo(this._apiServices);

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await _apiServices.post(
        ApiEndPoints.login,
        loginRequestModel.toJson(),
      );

      return LoginResponseModel.fromJson(response);
    } catch (error) {
      if (error is ApiError) {
        rethrow;
      } else {
        throw ApiError(message: error.toString());
      }
    }
  }
}
