import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/app-constants.dart';
import 'package:immocrowd/core/util/design-constants.dart';
import 'package:provider/provider.dart';

import 'auth.dart';
import 'core/providers/properties-provider.dart';
import 'firebase_options.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/manage_properties_screen.dart';
import 'ui/screens/login/login_email_password_screen.dart';
import 'ui/screens/login/phone_screen.dart';
import 'ui/screens/login/signup_email_password_screen.dart';
import 'ui/screens/view_properties.dart';
import 'ui/widgets/user/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (kIsWeb) {
  //   FacebookAuth.i.webInitialize(
  //     appId: "1129634001214960", // Replace with your app id
  //     cookie: true,
  //     xfbml: true,
  //     version: "v12.0",
  //   );
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    ;
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PropertiesProvider>(
            create: (_) => PropertiesProvider(),
          )
        ],
        child: MaterialApp(
            title: AppConstants.TITLE,
            theme: ThemeData(
              primarySwatch: createMaterialColor(Color(DesignConstants.GREEN)),
              //: : Colors.deepOrange,
            ),
            home: HomeScreen(),
            routes: {
              ViewPropertiesScreen.routeName: (context) =>
                  const ViewPropertiesScreen(),
              EmailPasswordSignup.routeName: (context) =>
                  const EmailPasswordSignup(),
              EmailPasswordLogin.routeName: (context) =>
                  const EmailPasswordLogin(),
              PhoneScreen.routeName: (context) => const PhoneScreen(),
              ManagePropertiesScreen.routeName: ((context) =>
                  ManagePropertiesScreen()),
              ProfilePage.routeName: (context) => const ProfilePage(),
              AuthGate.routeName: (context) => const AuthGate(),
            }));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      print("firebaseUser " + firebaseUser.uid);
      return const ViewPropertiesScreen();
    }
    print("firebaseUser null");
    return const ViewPropertiesScreen();
  }
}
