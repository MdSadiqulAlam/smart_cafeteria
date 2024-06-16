import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/homepage/homepage.dart';
import 'config/theme/theme.dart';
import 'config/theme/util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      theme: theme.light(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

