import 'dart:convert';

class Credentials {
  final String email;
  final String password;

  Credentials({required this.email, required this.password});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
