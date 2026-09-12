import 'package:bloc/bloc.dart';
import 'package:hungry_app/core/networking/api_error.dart';
import 'package:hungry_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:hungry_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:hungry_app/features/sign_up/manager/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  //  Dependency Injection
  SignUpCubit(this._signUpRepo) : super(SignUpInitialState());

  Future<void> emitSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    try {
      final signUpRequest = SignUpRequestModel(
        name: name,
        email: email,
        password: password,
      );

      final response = await _signUpRepo.signUp(signUpRequest);

      emit(SignUpSuccessState(response));
    } catch (error) {
      if (error is ApiError) {
        emit(SignUpErrorState(error.message));
      } else {
        emit(SignUpErrorState(error.toString()));
      }
    }
  }
}
