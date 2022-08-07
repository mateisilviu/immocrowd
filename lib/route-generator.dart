import 'package:flutter/material.dart';

import 'auth.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/login/login_email_password_screen.dart';
import 'ui/screens/login/signup_email_password_screen.dart';
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
      case AuthGate.routeName:
        return MaterialPageRoute(builder: (context) => AuthGate());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case ManagePropertiesScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => ManagePropertiesScreen());
      case EmailPasswordLogin.routeName:
        return MaterialPageRoute(builder: (context) => EmailPasswordLogin());
      case EmailPasswordSignup.routeName:
        return MaterialPageRoute(builder: (context) => EmailPasswordSignup());
      case ViewPropertiesScreen.routeName:
        return MaterialPageRoute(builder: (context) => ViewPropertiesScreen());
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
