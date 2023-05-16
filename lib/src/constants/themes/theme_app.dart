import 'package:flutter/material.dart';
import 'package:myflix/src/constants/constants.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorApp.white,
    colorScheme: const ColorScheme.light(
      primary: ColorApp.red,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorApp.black,
    colorScheme: const ColorScheme.dark(
      primary: ColorApp.red,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
