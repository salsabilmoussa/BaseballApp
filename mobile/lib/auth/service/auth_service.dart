import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  final String? _url = dotenv.env['URL'];
  late bool isAuth = false;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_url/login_check'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt_token', token);
      isAuth = true;
      notifyListeners();
    }
    // else {
    //   throw Exception('Échec de la connexion : ${response.body}');
    // }
  }
}
