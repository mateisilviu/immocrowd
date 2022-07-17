import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

import 'core/providers/residence-provider.dart';
import 'core/services/firebase_auth_methods.dart';
import 'firebase_options.dart';
import 'ui/screens/login/login_email_password_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/login/phone_screen.dart';
import 'ui/screens/login/signup_email_password_screen.dart';
import 'ui/screens/manage_properties.dart';
import 'ui/screens/view_properties.dart';
import 'ui/widgets/user/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    FacebookAuth.i.webInitialize(
      appId: "1129634001214960", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null,
          ),
          ChangeNotifierProvider<ResidenceProvider>(
            create: (_) => ResidenceProvider(),
          )
        ],
        child: MaterialApp(
            title: 'IMMO Equity Crowdfunding',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              //: : Colors.deepOrange,
            ),
            home: AuthWrapper(),
            routes: {
              EmailPasswordSignup.routeName: (context) =>
                  const EmailPasswordSignup(),
              EmailPasswordLogin.routeName: (context) =>
                  const EmailPasswordLogin(),
              PhoneScreen.routeName: (context) => const PhoneScreen(),
              ManagePropertiesScreen.routeName: ((context) =>
                  ManagePropertiesScreen()),
              ProfilePage.routeName: (context) => const ProfilePage(),
            }));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const ViewPropertiesScreen();
    }
    return const LoginScreen();
  }
}
