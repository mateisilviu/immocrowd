import 'package:flutter/material.dart';

import '../../core/util/responsive.dart';
import '../widgets/general/header.dart';
import '../widgets/general/left_description.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var padding = ResponsiveWidget.calculatePadding_20_100_150(context);
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_page.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //appBar: // Your app bar
        // backgroundColor: const Color(0xff6ae792),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Top Header
              Padding(
                padding:
                    EdgeInsets.only(left: padding, top: 20, right: padding),
                child: HeaderWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(left: padding, top: 0, right: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    LeftDescription(),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
