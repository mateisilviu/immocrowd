import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/howto/howto_screen.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

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
      ListTile(
          leading: Icon(Icons.rss_feed),
          title: Text('Blog'),
          onTap: () =>
              {html.window.open("https://blog.immoequityfund.com/", "_self")}),
      ListTile(
          leading: Icon(Icons.question_mark),
          title: Text('How it works'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HowToScreen.routeName);
          }),
      const ListTile(
          leading: Icon(Icons.question_mark), title: Text('FAQ'), onTap: null),
      const ListTile(
          leading: Icon(Icons.group), title: Text('About us'), onTap: null),
      if (firebaseUser != null &&
          firebaseUser.email!.compareTo('tzevy.cont@gmail.com') == 0)
        const ListTile(
            leading: Icon(Icons.group),
            title: Text('Manage properties'),
            onTap: null),
    ]));
  }
}
