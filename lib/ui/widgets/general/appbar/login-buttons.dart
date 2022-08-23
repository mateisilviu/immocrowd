import 'package:flutter/material.dart';

import '../../../screens/login/login_screen.dart';
import '../../../screens/login/signup_screen.dart';

List<Widget> createLoginSignInButtons(BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () =>
              {Navigator.of(context).pushNamed(LoginScreen.routeName)},
          child: Text('Login')),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () =>
              {Navigator.of(context).pushNamed(SignUpScreen.routeName)},
          child: Text('Sign up')),
    )
  ];
}
