import 'package:flutter/material.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: horizontalPadding * 0.05),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Copyright © FutureCompanyName S.R.L 2022")],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset('images/social/fb_32.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/social/ln_32.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/social/yt_32.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/social/tw_32.png'),
                ],
              )
            ],
          )
        ]));
  }
}
