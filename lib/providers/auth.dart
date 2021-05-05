import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryData;
  String _userId;

  // Register
  Future<void> signup(String email, String password) async {
    final apiKey = 'AIzaSyAv4Wl3chqcBmRdqOCE1L91QH14ts8ZT1k';
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey');

    final response = await http.post(
      url,
      body: json.encode(
        {
          email: email,
          password: password,
          'returnSecureToken': true,
        },
      ),
    );

    print(json.decode(response.body));
  }
}
