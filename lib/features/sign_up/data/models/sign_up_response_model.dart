class SignUpResponseModel {
  final int statusCode;
  final String message;
  final Data? data;

  SignUpResponseModel({
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json["message"],
      statusCode: json["code"],
      data: json["data"] != null ? Data.fromJson(json["data"]) : null,
    );
  }
}

class Data {
  final String name;
  final String email;
  final String? token;
  final String? image;

  Data({required this.name, required this.email, this.token, this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json["name"] ?? "Default Name",
      email: json["email"] ?? "Default Email",
      token: json["token"],
      image: json["image"],
    );
  }
}
