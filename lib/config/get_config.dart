import 'package:flutter/material.dart';

class GetConfig {
  static bool checkBrightness(BuildContext context) =>
      (View.of(context).platformDispatcher.platformBrightness ==
          Brightness.light);

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getBottomNavigationBarHeight() => kBottomNavigationBarHeight;

  static double getAppBarHeight() => kToolbarHeight;

  static ColorScheme getColorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;
}
