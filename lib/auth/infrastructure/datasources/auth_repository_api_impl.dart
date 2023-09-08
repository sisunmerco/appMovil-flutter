import 'package:swaypapp/auth/domain/domain.dart';
import 'package:swaypapp/auth/infrastructure/repositories/auth_datasource_api_Impl.dart';

class AuthRepositoryApiImpl extends AuthRepositoryApi {
  final AuthDatasourceApi authDataSource;
  AuthRepositoryApiImpl({AuthDatasourceApi? authDataSource})
      : authDataSource = authDataSource ?? AuthDatasourceApiImpl();

  @override
  Future<User> authState(String token) async {
    return await authDataSource.authState(token);
  }

  @override
  Future<User> signIn(String email, String password) async {
    return await authDataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return await authDataSource.signOut();
  }
}
