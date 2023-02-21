import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/auth.dart';
import './settings/routes/route.dart';
import './settings/color/color.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArticulationSupport',
      darkTheme: colorDataDark,
      theme: colorDataLight,
      themeMode: ThemeMode.system, // モードをシステム設定にする
      home: const Auth(title: 'AuthPage'),
      routes: route,
    );
  }
}
