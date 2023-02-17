import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Test extends StatelessWidget {
  static const routeName = '/test';
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(FirebaseAuth.instance.currentUser!.displayName!),
      ),
    );
  }
}
