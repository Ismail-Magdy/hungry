class LoginResponseModel {
  final int? statusCode;
  final String message;
  final Data? data;
  LoginResponseModel({this.statusCode, required this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json["message"] ?? "Default Message",
      statusCode: json["code"],
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }
}

class Data {
  final String? token;
  final String name;
  final String email;

  Data({this.token, required this.name, required this.email});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json["name"] ?? "Default Name",
      email: json["email"] ?? "Default Email",
      token: json["token"],
    );
  }
}
