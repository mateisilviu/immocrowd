import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/responsive.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';

import '../../../core/util/app-constants.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  Navigator.of(context)
                      .pushReplacementNamed(ViewPropertiesScreen.routeName)
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
          ],
        )
      ],
    );
  }
}
