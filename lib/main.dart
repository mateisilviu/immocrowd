import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/residence-provider.dart';
import 'ui/screens/manage_properties.dart';
import 'ui/screens/view_properties.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
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
            home: ViewPropertiesScreen(),
            routes: {
              ManagePropertiesScreen.routeName: ((context) =>
                  ManagePropertiesScreen())
            }));
  }
}
