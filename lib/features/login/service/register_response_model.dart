class RegisterResponseModel {
  final String status;
  final String token;
  final dynamic user;

  RegisterResponseModel({
    required this.status,
    required this.token,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'] ?? '',
      token: json['token'] ?? '',
      user: json['user'] ?? {},
    );
  }
}
