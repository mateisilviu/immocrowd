import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/manage_properties.dart';
import 'package:provider/provider.dart';

import 'profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return Drawer(
        child: Column(children: [
      AppBar(title: const Text('Hello'), automaticallyImplyLeading: false),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      firebaseUser != null
          ? ListTile(
              leading: const Icon(Icons.add_task),
              title: const Text('Manage Properties'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ManagePropertiesScreen.routeName);
              },
            )
          : ListTile(
              leading: const Icon(Icons.add_task),
              title: const Text('Manage Properties'),
              onTap: null,
            ),
      firebaseUser != null
          ? ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfilePage.routeName);
              },
            )
          : ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: null)
    ]));
  }
}
