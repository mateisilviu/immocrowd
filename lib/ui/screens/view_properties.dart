import 'package:flutter/material.dart';
import 'package:immocrowd/core/providers/residence-provider.dart';
import 'package:immocrowd/core/util/app-constants.dart';
import 'package:provider/provider.dart';

import '../widgets/user/app_drawer.dart';
import '../widgets/user/profile.dart';
import '../widgets/user/property_grid.dart';

class ViewPropertiesScreen extends StatefulWidget {
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
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ResidenceProvider>(context).getResidences().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.TITLE), actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
              child: Icon(
                Icons.person,
                size: 26.0,
              ),
            ))
      ]),
      drawer: AppDrawer(),
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
