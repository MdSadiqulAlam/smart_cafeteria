import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/theme_switch.dart';

class AppbarMenu extends StatelessWidget {
  const AppbarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child:ThemeSwitch(),
    );
  }
}
