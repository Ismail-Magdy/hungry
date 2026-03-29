import 'package:bloc/bloc.dart';
import 'package:hungry_app/core/networking/api_error.dart';
import 'package:hungry_app/features/login/data/models/login_request_model.dart';
import 'package:hungry_app/features/login/data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  //  Dependency Injection
  LoginCubit(this._loginRepo) : super(LoginInitial());

  Future<void> emitLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final loginRequest = LoginRequestModel(email: email, password: password);

      final response = await _loginRepo.login(loginRequest);

      emit(LoginSuccess(response));
    } catch (error) {
      if (error is ApiError) {
        emit(LoginFailure(error.message));
      } else {
        emit(LoginFailure(error.toString()));
      }
    }
  }
}
