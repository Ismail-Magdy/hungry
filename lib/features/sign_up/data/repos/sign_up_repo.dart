import 'package:hungry_app/core/constants/api_end_points.dart';
import 'package:hungry_app/core/networking/api_error.dart';
import 'package:hungry_app/core/networking/api_services.dart';
import 'package:hungry_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:hungry_app/features/sign_up/data/models/sign_up_response_model.dart';

class SignUpRepo {
  final ApiServices _apiServices;
  SignUpRepo(this._apiServices);

  Future<SignUpResponseModel> signUp(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final response = await _apiServices.post(
        ApiEndPoints.register,
        signUpRequestModel.toJson(),
      );
      return SignUpResponseModel.fromJson(response);
    } on ApiError {
      rethrow;
    } catch (error) {
      throw ApiError(message: error.toString());
    }
  }
}
