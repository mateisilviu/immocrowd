import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/navigator.dart';
import '../../../screens/auth/login_screen.dart';
import '../../../screens/auth/signup_screen.dart';

List<Widget> createLoginSignInButtons(BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () =>
              {NavigatorService(context).pushNamed(LoginScreen.routeName)},
          child: Text('Login')),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () =>
              {NavigatorService(context).pushNamed(SignUpScreen.routeName)},
          child: Text('Sign up')),
    )
  ];
}
