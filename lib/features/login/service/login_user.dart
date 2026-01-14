
  import 'dart:convert';

import 'package:http/http.dart' ;

Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://rehabko.abdaealmasi.store/api/login');

    try {
      final response = await post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
