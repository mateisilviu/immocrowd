import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/login/verify_email_screen.dart';

import '../../widgets/login/login_widget.dart';
import '../../widgets/login/signup_widget.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return VerifyEmailScreen();
            } else {
              return isLogin
                  ? LoginWidget(onClickedSignUp: toggle)
                  : SignUpWidget(onClickedSignIn: toggle);
            }
          },
        ),
      );

  void toggle() => setState(() => isLogin = !isLogin);
}
