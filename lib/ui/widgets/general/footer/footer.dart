import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/design-constants.dart';

import '../../../screens/howto/howto_screen.dart';
import 'social-links.dart';

class FooterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: double.infinity,
        child: (Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Center(child: Text("Logo")),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Text("Menu",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Active opportunities"),
                          ),
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.of(context).pushReplacementNamed(
                                      HowToScreen.routeName)
                                },
                                child: Text(
                                  'How it works.',
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Statistics"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Text("Info",
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Text("Company",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("FAQ"),
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
                            child: Text("Blog"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Contact"),
                          )
                        ],
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
}
