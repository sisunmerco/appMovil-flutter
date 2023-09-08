import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:swaypapp/auth/screens/login_screen.dart';
import 'config/global/environment.dart';
import 'config/themes/default_theme.dart';

void main() async {
  await Environment.initEnvironmant();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWAYP mensajeros',
      theme: DefaultTheme.setThemeDefault,
      home: const LoginScreen(),
    );
  }
}
