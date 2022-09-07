import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/howto/howto_screen.dart';
import 'package:immocrowd/ui/screens/login/login_screen.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';
import 'dart:html' as html;

import '../../screens/login/signup_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    print(firebaseUser);
    return Drawer(
        child: Column(children: [
      // AppBar(title: null, automaticallyImplyLeading: false),
      if (firebaseUser != null)
        UserAccountsDrawerHeader(
            accountName: Text(firebaseUser.displayName ?? ""),
            accountEmail: Text(firebaseUser.email ?? ""),
            onDetailsPressed: () => Navigator.of(context)
                .pushReplacementNamed(ViewPropertiesScreen.routeName),
            currentAccountPicture: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: Image.asset("images/drawer/avatar_90.gif")))
      else
        ...buildLoginSingInButtons(context),
      ListTile(
        leading: Image.asset("images/drawer/home.gif"),
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      //firebaseUser != null
      // ?
      ListTile(
        leading: Image.asset("images/drawer/view_properties.gif"),
        title: const Text('View Properties'),
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(ViewPropertiesScreen.routeName);
        },
      ),
      ListTile(
          leading: Image.asset("images/drawer/blog.gif"),
          title: Text('Blog'),
          onTap: () =>
              {html.window.open("https://blog.immoequityfund.com/", "_self")}),
      ListTile(
          leading: Image.asset("images/drawer/how_it_works.gif"),
          title: Text('How it works'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HowToScreen.routeName);
          }),
      ListTile(
          leading: Image.asset("images/drawer/faq.gif"),
          title: Text('FAQ'),
          onTap: null),
      ListTile(
          leading: Image.asset("images/drawer/about_us.gif"),
          title: Text('About us'),
          onTap: null),
      if (firebaseUser != null) ...buildDividerAndLogout(context),
      if (firebaseUser != null &&
          firebaseUser.email!.compareTo('tzevy.cont@gmail.com') == 0)
        const ListTile(
            leading: Icon(Icons.group),
            title: Text('Manage properties'),
            onTap: null),
    ]));
  }

  List<Widget> buildLoginSingInButtons(BuildContext context) {
    return [
      ListTile(
        leading: Image.asset("images/drawer/login.gif"),
        title: const Text('Login'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        },
      ),
      ListTile(
        leading: Image.asset("images/drawer/signup.gif"),
        title: const Text('Sign Up'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
        },
      ),
    ];
  }

  List<Widget> buildDividerAndLogout(BuildContext context) {
    return [
      Divider(),
      ListTile(
          leading: Image.asset("images/profile/logout.gif"),
          title: Text('Logout'),
          onTap: null),
    ];
  }
}
