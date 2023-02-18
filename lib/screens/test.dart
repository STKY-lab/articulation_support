import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './cards.dart';

class Test extends StatelessWidget {
  static const routeName = '/test';
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FirebaseAuth.instance.currentUser!.displayName!),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Cards.routeName),
              child: const Text('CardTestへ'),
            )
          ],
        ),
      ),
    );
  }
}
