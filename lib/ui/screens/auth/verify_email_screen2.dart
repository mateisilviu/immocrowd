import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/services/firebase_auth_methods.dart';
import '../view_properties.dart';

class VerifyEmailScreen2 extends StatelessWidget {
  const VerifyEmailScreen2({required this.oobCode});
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
            return _buildCenterText(
                context,
                'Thank you! Your are email is verified.',
                'Browse active oportunities ',
                ViewPropertiesScreen.routeName);
          } else {
            return Center(
              child: Text("failure"),
            );
          }
        },
      ),
    );
  }

  Widget _buildCenterText(
      BuildContext context, String text1, String text2, String routeName) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20),
          text: text1,
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    {Navigator.of(context).pushReplacementNamed(routeName)},
              text: text2,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
