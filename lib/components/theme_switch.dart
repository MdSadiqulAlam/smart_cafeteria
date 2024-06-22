import 'package:flutter/material.dart';

bool darkTheme = false;
class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: darkTheme,
      onChanged: (bool value) {
        setState(
          () {
            darkTheme = value;
          },
        );
      },
    );
  }
}
