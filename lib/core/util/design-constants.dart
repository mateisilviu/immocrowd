import 'package:flutter/material.dart';

class DesignConstants {
  static int GREEN = 0xff97f9e3;
  static const int LIGHT_GREEN = 0xffc1fbee;
  static int BLACK_BLUE = 0xff28313b;

  static const Color lightGreenColor = Color(LIGHT_GREEN);

  // orange fdb43cff , f47a11ff

  static TextStyle hugeText = TextStyle(
    fontFamily: 'Poppins',
    color: Color(DesignConstants.BLACK_BLUE),
    fontSize: 50,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    //letterSpacing: 1.5,
  );

  static TextStyle largeText = TextStyle(
    fontFamily: 'Poppins',
    color: Color(DesignConstants.BLACK_BLUE),
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    //  letterSpacing: 1.627907,
  );
  static TextStyle mediumText = TextStyle(
    fontFamily: 'Poppins',
    color: Color(DesignConstants.BLACK_BLUE),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    //  letterSpacing: 1.627907,
  );
  static TextStyle smallText = TextStyle(
    fontFamily: 'Poppins',
    color: Color(DesignConstants.BLACK_BLUE),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    //  letterSpacing: 1.627907,
  );
}
