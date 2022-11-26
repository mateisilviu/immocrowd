import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/services/firebase_auth_methods.dart';

class AuthActionScreen extends StatelessWidget {
  static const String fullPath = '/auth/action';

  AuthActionScreen({required this.mode, required this.oobCode});

  final String mode;
  final String oobCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            FirebaseAuthMethods(FirebaseAuth.instance).validateEmail(oobCode),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == true) {
            return Center(
              child: Text("success"),
            );
          } else {
            return Center(
              child: Text("failure"),
            );
          }
        },
      ),
    );
  }
}

enum Mode { resetPassword, recoverEmail, verifyEmail, unknown }
