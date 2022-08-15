import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/responsive.dart';
import 'package:immocrowd/ui/screens/login/auth_screen.dart';
import 'package:immocrowd/ui/screens/login/login_screen.dart';
import 'package:immocrowd/ui/screens/login/signup_screen.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';

import '../../../core/util/app-constants.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    return ResponsiveWidget.isSmallScreen(context)
        ? AppBar(title: const InkWell(child: Text(AppConstants.TITLE)))
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(AppConstants.TITLE,
                          style: ResponsiveWidget.calculateTextStyle(context)),
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
                            style: ResponsiveWidget.calculateTextStyle(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Blog',
                          style: ResponsiveWidget.calculateTextStyle(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'FAQ',
                          style: ResponsiveWidget.calculateTextStyle(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'About us',
                          style: ResponsiveWidget.calculateTextStyle(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () => {
                                  Navigator.of(context)
                                      .pushNamed(LoginScreen.routeName)
                                },
                            child: Text('Login')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  Navigator.of(context)
                                      .pushNamed(SignUpScreen.routeName)
                                },
                            child: Text('Sign up')),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
