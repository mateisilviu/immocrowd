import 'package:flutter/material.dart';
import 'package:immocrowd/ui/screens/view_properties.dart';

import '../../../core/util/app-constants.dart';
import '../../screens/home_screen.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // logo
        Container(
          width: 200,
          height: 60,
          child: const InkWell(
            child: Text(
              AppConstants.TITLE,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff28313b),
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                //  letterSpacing: 1.627907,
              ),
            ),
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
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff28313b),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    //  letterSpacing: 1.627907,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Blog',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff28313b),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  //letterSpacing: 1.627907,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'FAQ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff28313b),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  //  letterSpacing: 1.627907,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'About us',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff28313b),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  // letterSpacing: 1.627907,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
