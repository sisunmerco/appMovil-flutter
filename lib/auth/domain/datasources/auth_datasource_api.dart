import 'package:swaypapp/auth/domain/domain.dart';

abstract class AuthDatasourceApi {
  Future<User> signIn(String email, String password);
  Future<void> signOut();
  Future<User> authState(String token);
}
