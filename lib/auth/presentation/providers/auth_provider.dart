import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swaypapp/auth/infrastructure/infrastructure.dart';
import 'package:swaypapp/auth/presentation/controllers/auth_controller.dart';
import 'package:swaypapp/auth/presentation/state/auth_state.dart';

final authRepositoryProvider = Provider<AuthRepositoryApiImpl>((ref) {
  return AuthRepositoryApiImpl();
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref);
});
