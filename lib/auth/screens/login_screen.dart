import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swaypapp/auth/presentation/providers/auth_provider.dart';
import 'package:swaypapp/auth/presentation/state/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:swaypapp/config/themes/default_theme.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

bool _loading = false;
final _formKeyLogin = GlobalKey<FormState>();

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authControllerProvider, ((previous, state) {
      if (!_formKeyLogin.currentState!.validate()) {
        setState(() {
          _loading = false;
        });
      } else if (state is AuthStateInitial) {
        setState(() {
          _loading = false;
        });
      } else if (state is AuthStateError) {
        setState(() {
          _loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      } else if (state is AuthStateOut) {
        setState(() {
          _loading = false;
        });
      } else if (state is AuthStateSuccess) {
        setState(() {
          _loading = false;
        });
        context.go('/home');
      } else if (state is AuthStateLoading) {
        setState(() {
          _loading = true;
        });
      } else {
        setState(() {
          _loading = false;
        });
      }
    }));

    return Scaffold(
        body: SafeArea(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Center(
                        child: SingleChildScrollView(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 25.0),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 250,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKeyLogin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Por favor, ingresa tu correo electrónico';
                                    } else if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                      return 'Por favor, ingresa un correo electrónico válido';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Correo electrónico',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            DefaultTheme.borderRadiusField),
                                      )),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: isVisible ? true : false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Por favor, ingresa una contraseña';
                                    } else if (value.length < 6) {
                                      return 'La contraseña debe tener al menos 6 caracteres';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Contraseña',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isVisible
                                                ? isVisible = false
                                                : isVisible = true;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            DefaultTheme.borderRadiusField),
                                      )),
                                ),
                                const SizedBox(height: 32.0),
                                SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      style: DefaultTheme.primaryButtonStyle,
                                      onPressed: _loading
                                          ? null
                                          : () {
                                              ref
                                                  .read(authControllerProvider
                                                      .notifier)
                                                  .login(emailController.text,
                                                      passwordController.text);
                                            },
                                      child: _loading
                                          ? const CircularProgressIndicator()
                                          : const Text('Iniciar sesión'),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))))));
  }
}
