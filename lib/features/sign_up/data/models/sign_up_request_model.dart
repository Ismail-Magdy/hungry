class SignUpRequestModel {
  final String name;
  final String email;
  final String? phone;
  final String password;
  final String? image;

  SignUpRequestModel({
    required this.name,
    required this.email,
    this.phone,
    required this.password,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "image": image,
    };
  }
}
