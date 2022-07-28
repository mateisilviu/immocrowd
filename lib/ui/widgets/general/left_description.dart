import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/app-constants.dart';

import '../../../core/util/design-constants.dart';

class LeftDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 150),
        // title
        FittedBox(
          child: new Text('''Invest in real estate
with a single click 
and small amount of money.''',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff28313b),
                fontSize: 50,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                //letterSpacing: 1.5,
              )),
        ),
        // Description
        RichText(
            text: new TextSpan(children: [
          new TextSpan(
              text:
                  '''coowner.estate is a platform where you can build a real estate portofolio. 
              You invest small amounts of money along side other investors.
              You will receive dividents from rented properties.''',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff1a345d),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 1,
              )),
        ])),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            // button
            InkWell(
              onTap: () {},
              child: new Container(
                  width: 150,
                  height: 57,
                  child: Center(
                    child: new Text("Learn More",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(Colors.black.value),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 2,
                        )),
                  ),
                  decoration: new BoxDecoration(
                      color: Color(DesignConstants.GREEN),
                      borderRadius: BorderRadius.circular(8))),
            ),
            //
            SizedBox(width: 40),
            new Container(
              width: 34,
              height: 34,
              child: Icon(Icons.access_alarms),
            ),
            SizedBox(
              width: 10,
            ),
            new Text("Watch demo",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(DesignConstants.GREEN),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2,
                ))
          ],
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
