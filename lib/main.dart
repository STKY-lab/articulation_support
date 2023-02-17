import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArticulationSupport',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'HomePage'),
      routes: {
        Test.routeName: (context) => const Test(),
      },
    );
  }
}
