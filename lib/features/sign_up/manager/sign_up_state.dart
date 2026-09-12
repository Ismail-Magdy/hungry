import 'package:hungry_app/features/sign_up/data/models/sign_up_response_model.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final SignUpResponseModel signUpResponseModel;
  SignUpSuccessState(this.signUpResponseModel);
}

class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState(this.errorMessage);
}
