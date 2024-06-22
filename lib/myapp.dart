import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/theme_switch.dart';
import 'package:smart_cafeteria/pages/homepage/homepage.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme totalTheme = MaterialTheme(textTheme);
    //ThemeData myTheme= brightness == Brightness.light ? totalTheme.light() : totalTheme.dark();
    ThemeData myTheme =totalTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff63a002)),
      // ),
      debugShowCheckedModeBanner: false,
      home:  const MyHomePage(),
    );
  }
}
