import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return Drawer(
        child: Column(children: [
      AppBar(title: null, automaticallyImplyLeading: false),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      //firebaseUser != null
      // ?
      ListTile(
        leading: const Icon(Icons.list_alt),
        title: const Text('View Properties'),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(ViewPropertiesScreen.routeName);
        },
      ),
      const ListTile(
          leading: Icon(Icons.rss_feed), title: Text('Blog'), onTap: null),
      const ListTile(
          leading: Icon(Icons.question_mark), title: Text('FAQ'), onTap: null),
      const ListTile(
          leading: Icon(Icons.group), title: Text('About us'), onTap: null),
    ]));
  }
}
