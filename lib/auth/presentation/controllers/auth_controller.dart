import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swaypapp/auth/presentation/providers/auth_provider.dart';
import 'package:swaypapp/auth/presentation/state/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  // Ref: Un objeto utilizado por los proveedores para interactuar con otros proveedores
  //  y los ciclos de vida de la aplicación.
  final Ref ref;

  AuthController(this.ref) : super(const AuthStateInitial());

  void login(String email, String password) async {
    // El "estado" actual de este [StateNotifier].
    // Actualizar esta variable llamará sincrónicamente a todos los oyentes. Notificar a
    // los oyentes es O(N) con N el número de oyentes.
    // La actualización del estado arrojará si al menos un oyente arroja.

    state = const AuthStateLoading();
    try {
      await ref.read(authRepositoryProvider).signIn(email, password);
      state = const AuthStateSuccess();
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }

  // void signOut() async {
  //   try {
  //     await ref.read(authRepositoryProvider).signOut();
  //     state = const LoginStateOut();
  //   } catch (e) {
  //     state = LoginStateError(e.toString());
  //   }
  // }
}
