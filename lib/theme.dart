import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'settings.dart';

class C {
  static const back = Color(0xfff2f2f2);
  static const white = Colors.white;
  static const black = Colors.black;
  static const front = Color(0xfff87c97);
  static const front2 = Color(0xFFE4AAFF);
  static const grey = Color(0xFF444444);
  static const grey2 = Color(0xFFF2F2F2);
  static const grey3 = Color(0xFF9A9A9A);
  static const grey4 = Color(0xFFE9E9E9);
  static const grey5 = Color.fromARGB(255, 228, 228, 228);
  static const purple = Color(0xFF550879);
}

final theme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: C.back,
  fontFamily: GoogleFonts.inter().fontFamily,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.all(M.small),
        side: const BorderSide(color: C.front, width: 1),
        textStyle: const TextStyle(fontSize: 16, color: C.front),
        foregroundColor: C.back,
        backgroundColor: C.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 20, height: 1.4202273233, fontWeight: FontWeight.w700, color: C.black),
    bodyMedium: TextStyle(fontSize: 14, height: 1.2125, fontWeight: FontWeight.w600, color: C.front),
    bodySmall: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.w400, color: C.black),
    titleMedium: TextStyle(fontSize: 16, height: 1.2125, fontWeight: FontWeight.w700, color: C.front),
    titleLarge: TextStyle(fontSize: 20, height: 24 / 20, fontWeight: FontWeight.w400, color: C.back),
    titleSmall: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.w900, color: C.front),
    displayLarge: TextStyle(fontSize: 24, height: 24 / 29, fontWeight: FontWeight.w500, color: Colors.black),
    displaySmall: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.normal, color: C.front, fontStyle: FontStyle.italic),
    labelMedium: TextStyle(fontSize: 12, height: 1, fontWeight: FontWeight.w400, color: C.grey3),
    displayMedium: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.w400, color: C.front),
  ),
);
