import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  const LoginService();
  Future<bool> execute(
      {required String password, required String email}) async {
    var url = Uri.http('10.0.2.2:5000', '/login');
    var response = await http.post(url,
        body: jsonEncode({'email': email, 'senha': password}),
        headers: {'Content-Type': 'application/json'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
