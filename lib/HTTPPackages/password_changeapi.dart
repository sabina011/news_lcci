import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/change_password model/change_password.dart';

const String base_url = "https://lekhnathcci.org.np/api";


class PasswordChangeApi {
  final String baseUrl;

  PasswordChangeApi(this.baseUrl);

  Future<PasswordChangeResponse> changePassword(String username,String newPassword,String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/member/changePassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': newPassword,
        'confirm_password': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      return PasswordChangeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to change password');
    }
  }
}
