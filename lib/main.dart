import 'dart:convert';

import 'package:coownergeneration/go-route-generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/providers/properties-provider.dart';
import 'core/util/app-constants.dart';
import 'firebase_options.dart';
import 'route-generator.dart';
import 'ui/screens/home/home_screen.dart';

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
  var selectedTheme = await _onThemeSelected("appainter_theme_0xff97f9e3");

  setPathUrlStrategy();

  runApp(MyApp(
    theme: selectedTheme,
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  // MaterialColor createMaterialColor(Color color) {
  //   List strengths = <double>[.05];
  //   Map<int, Color> swatch = {};
  //   final int r = color.red, g = color.green, b = color.blue;

  //   for (int i = 1; i < 10; i++) {
  //     strengths.add(0.1 * i);
  //   }
  //   for (var strength in strengths) {
  //     final double ds = 0.5 - strength;
  //     swatch[(strength * 1000).round()] = Color.fromRGBO(
  //       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
  //       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
  //       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
  //       1,
  //     );
  //   }
  //   ;
  //   return MaterialColor(color.value, swatch);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PropertiesProvider>(
            create: (_) => PropertiesProvider(),
          )
        ],
        // child: MaterialApp(
        //   title: AppConstants.TITLE,
        //   theme: theme,
        //   navigatorKey: navigatorKey,
        //   home: HomeScreen(),
        //   onGenerateRoute: RouteGenerator.generateRoute,
        //   initialRoute: '/',
        // ));
        child: MaterialApp.router(
            title: AppConstants.TITLE,
            theme: theme,
            routerConfig: GoRouteGenerator().router));
  }
}

Future<ThemeData> _onThemeSelected(String themeId) async {
  var themeStr = await rootBundle.loadString('assets/themes/$themeId.json');
  var themeJson = json.decode(themeStr);

  return ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();
}


// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         print('User is signed in!');
//       }
//     });

//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser != null) {
//       print("firebaseUser " + firebaseUser.uid);
//       return const ViewPropertiesScreen();
//     }
//     print("firebaseUser null");
//     return const ViewPropertiesScreen();
//   }
// }
