import 'package:flutter/material.dart';

import '../../../core/util/responsive.dart';
import '../../widgets/general/footer/footer.dart';
import '../../widgets/general/header.dart';
import '../../widgets/user/app_drawer.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({String errorMessage = "An error occured."});

  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderWidget(), // Your app bar
      // backgroundColor: const Color(0xff6ae792),
      drawer: ResponsiveWidget.isSmallScreen(context) ? AppDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 600,
              child: Center(
                  child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/error/error_400.gif'))),
                  ),
                  Text(
                    errorMessage,
                    textScaleFactor: 2.5,
                  )
                ],
              )),
            ),
            FooterComponent()
          ],
        ),
      ),
    );
  }
}
