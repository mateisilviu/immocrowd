import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:immocrowd/core/util/design-constants.dart';
import 'package:immocrowd/core/util/responsive.dart';
import 'package:immocrowd/ui/screens/howto/howto_screen.dart';
import 'package:immocrowd/ui/screens/login/auth_screen.dart';
import 'package:immocrowd/ui/screens/login/login_screen.dart';
import 'package:immocrowd/ui/screens/login/signup_screen.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';

import '../../../core/util/app-constants.dart';
import 'appbar/login-buttons.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  HeaderWidget({this.title = AppConstants.TITLE});

  String title;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    var currentUser = FirebaseAuth.instance.currentUser;
    return ResponsiveWidget.isSmallScreen(context)
        ? AppBar(title: InkWell(child: Text(title)))
        : PreferredSize(
            preferredSize: Size(screenSize.width, 70),
            child: Container(
              color: DesignConstants.lightGreenColor,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: padding, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text(title,
                                style: ResponsiveWidget.calculateTextStyle(
                                    context)),
                            // onTap: () => {
                            //       Navigator.of(context)
                            //           .pushReplacementNamed(HomeScreen.routeName)
                            //     }
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.of(context).pushReplacementNamed(
                                      ViewPropertiesScreen.routeName)
                                },
                                child: Text(
                                  'Properties',
                                  style: ResponsiveWidget.calculateTextStyle(
                                      context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => {
                                  html.window.open(
                                      "https://blog.immoequityfund.com/",
                                      "_self")
                                },
                                child: Text(
                                  'Blog',
                                  style: ResponsiveWidget.calculateTextStyle(
                                      context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.of(context).pushReplacementNamed(
                                      HowToScreen.routeName)
                                },
                                child: Text(
                                  'How it works',
                                  style: ResponsiveWidget.calculateTextStyle(
                                      context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'FAQ',
                                style: ResponsiveWidget.calculateTextStyle(
                                    context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'About us',
                                style: ResponsiveWidget.calculateTextStyle(
                                    context),
                              ),
                            ),
                            if (currentUser == null)
                              ...createLoginSignInButtons(context)
                            else
                              _createProfile(context)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 5,
                  )
                ],
              ),
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);

  Widget _createProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Color(DesignConstants.GREEN),
        radius: 20,
      ),
    );
  }
}
