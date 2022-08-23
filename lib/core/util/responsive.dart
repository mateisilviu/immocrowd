import 'package:flutter/material.dart';
import 'package:immocrowd/core/util/design-constants.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static double calculatePadding_20_100_150(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? 10.0
        : ResponsiveWidget.isMediumScreen(context)
            ? 70.0
            : 100.0;
  }

  static TextStyle calculateTextStyle(BuildContext context,
      {bool huge = false}) {
    if (huge == true && ResponsiveWidget.isLargeScreen(context)) {
      return DesignConstants.hugeText;
    }
    return ResponsiveWidget.isSmallScreen(context)
        ? DesignConstants.smallText
        : ResponsiveWidget.isMediumScreen(context)
            ? DesignConstants.mediumText
            : DesignConstants.largeText;
  }

  static int calculateCrossAxisCount(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? 1
        : ResponsiveWidget.isMediumScreen(context)
            ? 2
            : 3;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
