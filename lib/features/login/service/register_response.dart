import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yumquick/features/login/service/register_response_model.dart';

Future<RegisterResponseModel?> registerUser({
  required String name,
  required String email,
  required String password,
  required String confirmPassword,
}) async {
  final url = Uri.parse(
    'https://rehabko.abdaealmasi.store/api/register',
  );

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return RegisterResponseModel.fromJson(data);
    } else {
      print(" Register Failed");
      print("Status Code: ${response.statusCode}");
      print("Body: ${response.body}");
      return null;
    }
  } catch (e) {
    print(" Exception: $e");
    return null;
  }
}
