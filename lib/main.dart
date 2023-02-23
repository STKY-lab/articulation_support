import 'package:articulation_support/settings/color/color_dark.dart';
import 'package:articulation_support/settings/color/color_light.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './screens/auth.dart';
import './screens/home.dart';
import './firebase_options.dart';
import './settings/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(child: MyApp()),
  );
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Auth(title: 'AuthPage');
          }
        },
      ),
      routes: route,
    );
  }
}
