import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  //Color
  static const MaterialColor mainColor = Colors.indigo;

  //String
  static const String appTitle = "Average Calculate";

  //Text Styles
  static TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static TextStyle lessonCountAndAverageStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static TextStyle averageResultTextStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  //form field style
  static BorderRadius borderRadius = BorderRadius.circular(25);

  //Padding

  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const formPadding = EdgeInsets.symmetric(horizontal: 10);
}
