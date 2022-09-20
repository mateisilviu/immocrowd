import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;

import '../../screens/faq/faq_screen.dart';
import '../../screens/howto/howto_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/login/signup_screen.dart';
import '../../screens/view_properties.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    print(firebaseUser);
    return Drawer(
        child: SingleChildScrollView(
      primary: true,
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
                  child: Image(
                      image: AssetImage("assets/images/drawer/avatar_90.gif"))))
        else
          ..._buildLoginSingInButtons(context),
        _buildCustomListTile('Home', 'assets/images/drawer/home_100.gif', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        _buildCustomListTile(
            'View Properties', 'assets/images/drawer/view_properties_100.gif',
            () {
          Navigator.of(context)
              .pushReplacementNamed(ViewPropertiesScreen.routeName);
        }),
        _buildCustomListTile(
            'Blog',
            'assets/images/drawer/blog_100.gif',
            () => {
                  // html.window.open("https://blog.immoequityfund.com/", "_self")
                }),
        _buildCustomListTile(
            'How it works',
            'assets/images/drawer/how_it_works_100.gif',
            () => {
                  Navigator.of(context)
                      .pushReplacementNamed(HowToScreen.routeName)
                }),
        _buildCustomListTile(
            'FAQ',
            'assets/images/drawer/faq_100.gif',
            () => {
                  Navigator.of(context)
                      .pushReplacementNamed(FaqScreen.routeName)
                }),
        _buildCustomListTile(
            'About us', 'assets/images/drawer/about_us_100.gif', () => {}),
        if (firebaseUser != null) ..._buildDividerAndLogout(context),
        if (firebaseUser != null &&
            firebaseUser.email!.compareTo('tzevy.cont@gmail.com') == 0)
          const ListTile(
              leading: Icon(Icons.group),
              title: Text('Manage properties'),
              onTap: null),
      ]),
    ));
  }

  Widget _buildCustomListTile(
      String text, String imageAsset, VoidCallback onTapFunction) {
    return Material(
      child: InkWell(
        onTap: onTapFunction,
        highlightColor: Colors.black26,
        child: Ink(
          child: Row(
            children: [
              Expanded(
                  child: Image(
                      height: 70, width: 70, image: AssetImage(imageAsset))),
              Expanded(
                  child: Text(
                text,
                textScaleFactor: 1.7,
              ))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLoginSingInButtons(BuildContext context) {
    return [
      _buildCustomListTile('Login', 'assets/images/drawer/login_100.gif', () {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }),
      _buildCustomListTile('Sign Up', 'assets/images/drawer/signup_100.gif',
          () {
        Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
      })
    ];
  }

  List<Widget> _buildDividerAndLogout(BuildContext context) {
    return [
      Divider(),
      _buildCustomListTile(
          'Logout', 'assets/images/drawer/logout_100.gif', () => {})
    ];
  }
}
