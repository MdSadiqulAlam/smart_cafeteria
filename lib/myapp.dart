import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/root_page.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme totalTheme = MaterialTheme(textTheme);
    ThemeData myTheme =
        getBrightness(context) ? totalTheme.light() : totalTheme.dark();
    // ThemeData myTheme = totalTheme.light();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      // theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff63a002))),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}
