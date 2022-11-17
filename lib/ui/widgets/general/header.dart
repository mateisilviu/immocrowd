import 'package:coownergeneration/ui/screens/dashboard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

import '../../../core/util/app-constants.dart';
import '../../../core/util/design-constants.dart';
import '../../../core/util/responsive.dart';
import '../../screens/faq/faq_screen.dart';
import '../../screens/howto/howto_screen.dart';
import '../../screens/view_properties.dart';
import 'appbar/login-buttons.dart';

class HeaderWidget extends StatefulWidget with PreferredSizeWidget {
  HeaderWidget({this.title = AppConstants.TITLE});

  final String title;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  var currentUser = null;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    setState(() {
      currentUser = FirebaseAuth.instance.currentUser;
    });
    return ResponsiveWidget.isSmallScreen(context)
        ? AppBar(title: InkWell(child: Text(widget.title)))
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
                            child: Text(widget.title,
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
                                  // Navigator.of(context).pushReplacementNamed(
                                  //     ViewPropertiesScreen.routeName)
                                  context.go(ViewPropertiesScreen.routeName)
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
                                  /* html.window.open(
                                      "https://blog.immoequityfund.com/",
                                      "_self")*/
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
                              child: InkWell(
                                onTap: () => {
                                  Navigator.of(context)
                                      .pushReplacementNamed(FaqScreen.routeName)
                                },
                                child: Text(
                                  'FAQ',
                                  style: ResponsiveWidget.calculateTextStyle(
                                      context),
                                ),
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

  Widget _createProfile(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: PopupMenuButton<Menu>(
              icon: Image.asset("images/profile/avatar_32.gif"),
              tooltip: "Profile",
              position: PopupMenuPosition.under,
              // Callback that sets the selected popup menu item.
              onSelected: (Menu item) {
                // setState(() {
                //   _selectedMenu = item.name;
                // });
                switch (item) {
                  case Menu.dashboard:
                    {
                      Navigator.of(context)
                          .pushReplacementNamed(DashboardScreen.routeName);
                      break;
                    }
                  case Menu.settings:
                    {
                      Navigator.pushReplacementNamed(
                          context, DashboardScreen.routeName,
                          arguments: true);
                      break;
                    }
                  default:
                    {
                      // nothing
                    }
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem<Menu>(
                      value: Menu.dashboard,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("images/profile/portofolio.gif"),
                          Text('Dashboard'),
                        ],
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.settings,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("images/profile/settings.gif"),
                          Text('Settings'),
                        ],
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<Menu>(
                      value: Menu.logout,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("images/profile/logout.gif"),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ]),
        ));
  }
}

// This is the type used by the popup menu below.
enum Menu { dashboard, portofolio, settings, logout }
