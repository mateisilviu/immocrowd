import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/app-constants.dart';
import 'package:immocrowd/ui/widgets/general/header.dart';

import '../../core/util/responsive.dart';
import '../widgets/user/app_drawer.dart';
import '../widgets/user/profile.dart';
import '../widgets/user/property_grid.dart';
import 'home/home_screen.dart';

class ViewPropertiesScreen extends StatefulWidget {
  static const String routeName = '/view-properties';

  const ViewPropertiesScreen({Key? key}) : super(key: key);

  @override
  State<ViewPropertiesScreen> createState() => _ViewPropertiesScreenState();
}

class _ViewPropertiesScreenState extends State<ViewPropertiesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AppDrawer() : null,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PropertyGrid(),
    );
  }
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
//       return const AuthGuard();
//     }
//     print("firebaseUser null");
//     return const ViewPropertiesScreen();
//   }
// }
