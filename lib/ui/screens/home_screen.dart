import 'package:flutter/material.dart';

import '../../core/util/app-constants.dart';
import '../../core/util/responsive.dart';
import '../widgets/general/footer/footer.dart';
import '../widgets/general/header.dart';
import '../widgets/general/left_description.dart';
import '../widgets/user/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(title: const InkWell(child: Text(AppConstants.TITLE)))
          : null, // Your app bar
      // backgroundColor: const Color(0xff6ae792),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AppDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            if (ResponsiveWidget.isSmallScreen(context) == false)
              Padding(
                padding:
                    EdgeInsets.only(left: padding, top: 20, right: padding),
                child: HeaderWidget(),
              ),
            SizedBox(
                height: 600,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    addBackground(
                        "assets/images/home_page1.png", Alignment.centerRight),
                    Padding(
                      padding: EdgeInsets.only(
                          left: padding, top: 0, right: padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          LeftDescription(),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                height: 600,
                width: double.infinity,
                child: Center(child: Text("Another section")),
                decoration: BoxDecoration(color: Colors.lightGreen)),
            FooterComponent()
          ],
        ),
      ),
    );
  }

  //Adds background Image
  Widget addBackground(String assetImg, Alignment alignment) {
    return FractionallySizedBox(
        alignment: alignment, //to keep images aligned to right
        widthFactor: .6, //covers about 60% of the screen width
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage(assetImg),
        ))));
  }
}
