import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xff0e273b);
  static const Color secondaryColor = Color(0xffc107);

  static ThemeData appTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: secondaryColor,
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      buttonColor: primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline3: GoogleFonts.openSans(
            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        headline1: GoogleFonts.openSans(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.amber),
        headline2: GoogleFonts.openSans(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        bodyText1: GoogleFonts.openSans(
            fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),
        bodyText2: GoogleFonts.openSans(
            color: Colors.amber, fontSize: 14, fontWeight: FontWeight.w500),
        subtitle1: GoogleFonts.openSans(color: Colors.grey, fontSize: 12),
        subtitle2: GoogleFonts.openSans(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
        button: GoogleFonts.openSans(
            backgroundColor: primaryColor, color: Colors.amber, fontSize: 18),
        caption: GoogleFonts.openSans(color: Colors.amber, fontSize: 16),
      ),
    );
  }
}
