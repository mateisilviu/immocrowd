import 'package:flutter/material.dart';

import '../../../../core/util/app-constants.dart';

class SocialLinks extends StatelessWidget {
  SocialLinks({this.isMobile: false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: horizontalPadding * 0.05),
        child: isMobile
            ? Column(children: [..._buildLinksAndText()])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [..._buildLinksAndText()]));
  }

  List<Widget> _buildLinksAndText() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text("Copyright © " + AppConstants.TITLE)],
      ),
      isMobile
          ? Center(
              child: Row(children: [..._buildSocial()]),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [..._buildSocial()],
                )
              ],
            )
    ];
  }

  List<Widget> _buildSocial() {
    return [
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
    ];
  }
}
