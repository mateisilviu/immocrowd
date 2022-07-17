import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/manage_properties.dart';

import 'profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      AppBar(title: const Text('Hello'), automaticallyImplyLeading: false),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.add_task),
        title: const Text('Manage Properties'),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(ManagePropertiesScreen.routeName);
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profile'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
        },
      )
    ]));
  }
}
