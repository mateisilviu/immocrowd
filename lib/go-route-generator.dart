import 'package:coownergeneration/ui/screens/home/home_screen.dart';
import 'package:coownergeneration/ui/screens/view_properties.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/screens/property_details_screen.dart';

class GoRouteGenerator {
  late final GoRouter _router = GoRouter(routes: <RouteBase>[
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
  ]);

  GoRouter get router {
    return _router;
  }
}
