import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/navigator.dart';
import '../../../core/util/showSnackbar.dart';
import '../../../main.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import 'login_screen.dart';
import 'verify_email_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/register';

  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Image(
                            height: 120,
                            width: 120,
                            image: AssetImage(
                                'assets/images/drawer/signup_100.gif')),
                        SizedBox(height: 20),
                        Text(
                          'Hey There ${firstNameController.text} ${lastNameController.text},\n Happy to have you on this platform',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: firstNameController,
                          //  cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: 'First name'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (firstName) =>
                              firstName != null && firstName.length < 2
                                  ? 'Enter min 2 characters'
                                  : null,
                        ),
                        TextFormField(
                          controller: lastNameController,
                          //  cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: 'Last name'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (lastName) =>
                              lastName != null && lastName.length < 2
                                  ? 'Enter min 2 characters'
                                  : null,
                        ),
                        TextFormField(
                          controller: emailController,
                          //  cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: 'Email'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Enter min. 6 characters'
                                  : null,
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          controller: confirmPasswordController,
                          textInputAction: TextInputAction.done,
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) => passwordController.text !=
                                  confirmPasswordController.text
                              ? 'Passwords do not match'
                              : null,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                            ),
                            icon: Icon(Icons.arrow_forward, size: 32),
                            label: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 24),
                            ),
                            onPressed: () => {signUp(context)}),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 20),
                            text: 'Already have an account?  ',
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        NavigatorService(context)
                                            .pushReplacementNamed(
                                                LoginScreen.routeName)
                                      },
                                text: 'Log In',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FooterComponent(),
              ],
            ),
          ),
        ),
      );

  Future signUp(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((result) => result.user!.updateDisplayName(
              firstNameController.text + " " + lastNameController.text));
    } on FirebaseAuthException catch (e) {
      print(e);

      showSnackBar(context, e.message);
    }
    NavigatorService(context).pushReplacementNamed(VerifyEmailScreen.routeName);
    //Navigator.of(context).pushNamed(VerifyEmailScreen.routeName);
    // Navigator.of(context) not working!
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
