import 'package:coownergeneration/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/faq/faq_screen.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/screens/howto/howto_screen.dart';
import 'ui/screens/login/auth_screen.dart';
import 'ui/screens/login/forgot_password_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/login/signup_screen.dart';
import 'ui/screens/login/verify_email_screen.dart';
import 'ui/screens/manage_properties_screen.dart';
import 'ui/screens/property_detail_screen.dart';
import 'ui/screens/property_details_screen.dart';
import 'ui/screens/view_properties.dart';
import 'ui/widgets/user/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardScreen.routeName:
        {
          final openSettings = settings.arguments == null ? false : true;
          return MaterialPageRoute(
            builder: (context) => DashboardScreen(openSettings: openSettings),
            settings: settings,
          );
        }

      case FaqScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => FaqScreen(),
          settings: settings,
        );
      case HowToScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => HowToScreen(),
          settings: settings,
        );
      // case PropertyDetailsScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => PropertyDetailsScreen(),
      //     settings: settings,
      //   );
      case PropertyDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => PropertyDetailScreen(),
          settings: settings,
        );
      case ProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
          settings: settings,
        );
      case ManagePropertiesScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ManagePropertiesScreen(),
          settings: settings,
        );
      case AuthScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => AuthScreen(),
          settings: settings,
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordScreen(),
          settings: settings,
        );
      case VerifyEmailScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => VerifyEmailScreen(),
          settings: settings,
        );
      case ViewPropertiesScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ViewPropertiesScreen(),
          settings: settings,
        );
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
    }
  }
}
