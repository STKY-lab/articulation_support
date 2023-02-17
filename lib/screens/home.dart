import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './test.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final googleLogin = GoogleSignIn();

    Firebase.initializeApp();
    Future<void> signIn() async {
      // Google認証
      GoogleSignInAccount? signinAccount = await googleLogin.signIn();
      if (signinAccount == null) {
        return;
      }

      // Firebaseへの認証情報を取得
      GoogleSignInAuthentication auth = await signinAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      // 認証情報をFirebaseAuthenticationに登録
      User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      // ログイン成功
      if (user != null) {
        // ログイン成功と同時にTitleへ遷移
        Navigator.of(context).pushReplacementNamed(Test.routeName);

        // FireStoreにusersを追加
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'username': user.displayName,
            'email': user.email,
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: signIn,
        ),
      ),
    );
  }
}
