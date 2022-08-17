import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';

import '../../../core/util/showSnackbar.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const String routeName = '/verify-email';
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    /// user needs to be created before!
    if (FirebaseAuth.instance.currentUser == null) {
      isEmailVerified = true;
    } else {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    }

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    // call after email verification!
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: HeaderWidget(),
      body: currentUser == null
          ? _buildCenterText(context, 'You are not logged in, please ',
              'Log in', LoginScreen.routeName)
          : isEmailVerified
              ? _buildCenterText(
                  context,
                  'Thank you! Your are email is verified.',
                  'Browse active oportunities ',
                  ViewPropertiesScreen.routeName)
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello ${currentUser.displayName}. A verification email has been sent to your email.',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                        ),
                        icon: Icon(Icons.email, size: 32),
                        label: Text(
                          'Resent Email',
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed:
                            canResendEmail ? sendVerificationEmail : null,
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () => FirebaseAuth.instance.signOut(),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      FooterComponent(),
                    ],
                  ),
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
