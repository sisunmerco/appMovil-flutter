import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:swaypapp/auth/domain/domain.dart';
import 'package:swaypapp/config/global/environment.dart';

class AuthDatasourceApiImpl extends AuthDatasourceApi {
  final apiUrl = Environment.apiUrl;
  final dio = Dio(
    BaseOptions(baseUrl: Environment.apiUrl),
  );

  @override
  Future<User> signIn(String email, String password) async {
    try {
      // //Credentials credentials = Credentials(email: email, password: password);
      // final response = await dio.post('/v1/authentication/login',
      //     data: {'email': email, 'password': password});
      //Credentials credentials = Credentials(email: email, password: password);
      Map<String, String> postHeaders = {"Content-Type": "application/json"};
      final encodedBody = json.encode({'email': email, 'password': password});
      final http.Response response = await http.post(
        Uri.parse('$apiUrl/v1/authentication/login'),
        headers: postHeaders,
        body: encodedBody,
      );

      return User.fromMap(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<User> authState(String token) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
