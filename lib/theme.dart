import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'settings.dart';

class C {
  static const back = Colors.white;
  static const front = Colors.black;
  static const grey = Color.fromARGB(255, 212, 212, 212);
  static const grey2 = Color.fromARGB(255, 100, 100, 100);
  static const grey3 = Color.fromARGB(255, 245, 245, 245);
  static const grey4 = Color.fromARGB(255, 219, 219, 219);
  static const grey5 = Color.fromARGB(255, 228, 228, 228);
}

final theme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: C.back,
  fontFamily: GoogleFonts.inter().fontFamily,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(R.normal)),
        ),
        padding: const EdgeInsets.all(M.small),
        side: const BorderSide(color: C.front, width: 2),
        textStyle: const TextStyle(fontSize: 16, color: C.front),
        foregroundColor: C.back,
        backgroundColor: C.front),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, height: 24 / 20, fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontSize: 14, height: 24 / 20, fontWeight: FontWeight.w700, color: C.front),
    displaySmall: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.normal, color: C.front, fontStyle: FontStyle.italic),
    displayMedium: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.normal, color: C.front),
    bodyMedium: TextStyle(fontSize: 14, height: 17 / 14, fontWeight: FontWeight.w400),
  ),
);
