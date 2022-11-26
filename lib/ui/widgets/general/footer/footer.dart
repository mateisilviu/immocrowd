import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../../../core/routes/navigator.dart';
import '../../../../core/util/design-constants.dart';
import '../../../../core/util/responsive.dart';
import '../../../screens/faq/faq_screen.dart';
import '../../../screens/howto/howto_screen.dart';
import 'social-links.dart';

class FooterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? buildMobileFooter(context)
        : buildDesktopFooter(context);
  }

  Widget buildDesktopFooter(BuildContext context) {
    return Container(
        height: 360,
        width: double.infinity,
        child: (Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 10,
              thickness: 5,
              color: Color(DesignConstants.GREEN),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLogo(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildMenu(context)],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildInfo()],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildCompany(context)],
                      ),
                    ])),
            Divider(
              height: 10,
              thickness: 5,
              color: Color(DesignConstants.GREEN),
            ),
            SocialLinks()
          ],
        )));
  }

  Widget buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: AspectRatio(
          aspectRatio: 2.63,
          child: Container(
            //width: 618,
            //height: 235,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'))),
            child: Container(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildMenu(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Menu", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Active opportunities"),
      ),
      Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            onTap: () => {
              NavigatorService(context)
                  .pushReplacementNamed(HowToScreen.routeName)
            },
            child: Text(
              'How it works.',
            ),
          )),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Statistics"),
      )
    ];
  }

  List<Widget> buildInfo() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Info", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Privacy policy"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Cookie policy"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Terms and Conditions"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Investment Risk"),
      )
    ];
  }

  List<Widget> buildCompany(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Company", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
            onTap: () => {
                  NavigatorService(context)
                      .pushReplacementNamed(FaqScreen.routeName)
                },
            child: Text("FAQ")),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("About us"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Support"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
            onTap: () => {},
            //{html.window.open("https://blog.immoequityfund.com/", "_self")},
            child: Text("Blog")),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Contact"),
      )
    ];
  }

  Widget buildMobileFooter(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 10,
          thickness: 5,
          color: Color(DesignConstants.GREEN),
        ),
        buildLogo(),
        ...buildMenu(context),
        ...buildInfo(),
        ...buildCompany(context),
        Divider(
          height: 10,
          thickness: 5,
          color: Color(DesignConstants.GREEN),
        ),
        SocialLinks(
          isMobile: true,
        )
      ]),
    );
  }
}
