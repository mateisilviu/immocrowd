import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/navigator.dart';
import '../../../core/util/showSnackbar.dart';
import '../../../main.dart';
import 'forgot_password_screen.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import '../view_properties.dart';
import 'signup_screen.dart';
import 'verify_email_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.emailVerified)
          NavigatorService(context).pushNamed(ViewPropertiesScreen.routeName);
        else
          NavigatorService(context).pushNamed(VerifyEmailScreen.routeName);
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: HeaderWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    Image(
                        height: 120,
                        width: 120,
                        image:
                            AssetImage('assets/images/drawer/login_100.gif')),
                    SizedBox(height: 20),
                    Text(
                      'Hey There ,\n Welcome Back!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: emailController,
                      //  cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                      icon: Icon(Icons.lock_open, size: 32),
                      label: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: signIn,
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () =>
                          NavigatorService(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      )),
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        text: 'No account?  ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    NavigatorService(context)
                                        .pushReplacementNamed(
                                            SignUpScreen.routeName)
                                  },
                            text: 'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              FooterComponent(),
            ],
          ),
        ),
      ));

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      showSnackBar(context, e.message);
    }

    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
