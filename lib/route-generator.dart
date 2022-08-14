import 'package:flutter/material.dart';

import 'ui/screens/home_screen.dart';
import 'ui/screens/login/auth_screen.dart';
import 'ui/screens/login/forgot_password_screen.dart';
import 'ui/screens/login/verify_email_screen.dart';
import 'ui/screens/manage_properties_screen.dart';
import 'ui/screens/property_detail_screen.dart';
import 'ui/screens/property_details_screen.dart';
import 'ui/screens/view_properties.dart';
import 'ui/widgets/user/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PropertyDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => PropertyDetailsScreen(),
          settings: settings,
        );
      case PropertyDetailScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => PropertyDetailScreen(),
          settings: settings,
        );
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case ManagePropertiesScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => ManagePropertiesScreen());
      case AuthScreen.routeName:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      case VerifyEmailScreen.routeName:
        return MaterialPageRoute(builder: (context) => VerifyEmailScreen());
      case ViewPropertiesScreen.routeName:
        return MaterialPageRoute(builder: (context) => ViewPropertiesScreen());
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
