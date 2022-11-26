import 'package:coownergeneration/ui/screens/auth/login_screen.dart';
import 'package:coownergeneration/ui/screens/faq/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/screens/auth/auth_action_screen.dart';
import '../../ui/screens/auth/signup_screen.dart';
import '../../ui/screens/auth/verify_email_screen.dart';
import '../../ui/screens/auth/verify_email_screen2.dart';
import '../../ui/screens/error/error_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/howto/howto_screen.dart';
import '../../ui/screens/manage_properties_screen.dart';
import '../../ui/screens/property_details_screen.dart';
import '../../ui/screens/view_properties.dart';
import '../../ui/widgets/user/profile.dart';

class GoRouteGenerator {
  late final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
          routes: <RouteBase>[]),
      GoRoute(
          path: ViewPropertiesScreen.routeName,
          builder: (BuildContext context, GoRouterState state) =>
              const ViewPropertiesScreen(),
          routes: <RouteBase>[
            GoRoute(
                path: PropertyDetailsScreen.routeName + '/:propertyId',
                builder: (BuildContext context, GoRouterState state) =>
                    PropertyDetailsScreen(
                        propertyId: state.params['propertyId']!)),
          ]),
      GoRoute(
        path: AuthActionScreen.fullPath,
        builder: (BuildContext context, GoRouterState state) {
          var modeStr = state.queryParams['mode'] as String;
          print("modeStr:" + modeStr);
          var mode;
          switch (modeStr) {
            case 'recoverEmail':
              {}
              break;
            case 'resetPassword':
              {
                mode = Mode.resetPassword;
              }
              break;
            case 'verifyEmail':
              {
                return VerifyEmailScreen(
                    state.queryParams['oobCode'] as String);
              }
            default:
              mode = Mode.unknown;
              break;
          }
          return ErrorScreen();
        },
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: VerifyEmailScreen.routeName,
        builder: (context, state) => VerifyEmailScreen(),
      ),
      GoRoute(
        path: FaqScreen.routeName,
        builder: (context, state) => FaqScreen(),
      ),
      GoRoute(
        path: HowToScreen.routeName,
        builder: (context, state) => HowToScreen(),
      ),
      GoRoute(
        path: ProfilePage.routeName,
        builder: (context, state) => ProfilePage(),
      ),
      GoRoute(
        path: ManagePropertiesScreen.routeName,
        builder: (context, state) => ManagePropertiesScreen(),
      ),
    ],
    //  errorBuilder: (context, state) => ErrorScreen(),
  );

  GoRouter get router {
    return _router;
  }
}
