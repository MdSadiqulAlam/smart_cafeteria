import 'package:flutter/material.dart';

bool getBrightness(BuildContext context) {
  // return true;
  return (View.of(context).platformDispatcher.platformBrightness ==Brightness.light);
}

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getScreenWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

double getBottomNavBarHeight() => kBottomNavigationBarHeight;

double getAppBarHeight() => kToolbarHeight;

ColorScheme getColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

TextTheme getTextTheme(BuildContext context) => Theme.of(context).textTheme;
