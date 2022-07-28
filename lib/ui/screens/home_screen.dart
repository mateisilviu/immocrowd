import 'package:flutter/material.dart';

import '../widgets/general/header.dart';
import '../widgets/general/left_description.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/';

  // @override
  Widget build2(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Top Header
            Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 20, right: 150),
              child: HeaderWidget(),
            ),
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                child: Image.asset('assets/images/home_page.png'),
              ),
            )
          ],
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    const EdgeInsets.only(left: 150.0, top: 20, right: 150),
                child: HeaderWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 0, right: 150),
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
