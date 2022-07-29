import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/app-constants.dart';

import '../../../core/util/design-constants.dart';
import '../../../core/util/responsive.dart';

class LeftDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dimension = ResponsiveWidget.calculatePadding_20_100_150(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: dimension),
        // title
        FittedBox(
          child: new Text('''Invest in real estate
with a single click 
and small amount of money.''',
              style: ResponsiveWidget.calculateTextStyle(context, huge: true)),
        ),
        // Description
        RichText(
            text: new TextSpan(children: [
          new TextSpan(
              text:
                  '''coowner.estate is a platform where you can build a real estate portofolio. 
              You invest small amounts of money along side other investors.
              You will receive dividents from rented properties.''',
              style: ResponsiveWidget.calculateTextStyle(context)),
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
                  height: 50,
                  child: Center(
                    child: new Text("Learn More",
                        style: ResponsiveWidget.calculateTextStyle(context)),
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
                style: ResponsiveWidget.calculateTextStyle(context))
          ],
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
