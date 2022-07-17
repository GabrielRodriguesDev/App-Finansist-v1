// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

ThemeData AppTheme(context) {
  return ThemeData(
    fontFamily: "MavenPro",
    backgroundColor: const Color.fromRGBO(249, 249, 249, 5),
    primaryColor: const Color(0xfffcfcff),
    scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 5),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionHandleColor: Colors.transparent,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromARGB(255, 40, 7, 228),
        secondary: const Color.fromARGB(255, 40, 7, 228)),
  );
}
