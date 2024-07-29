import 'package:flutter/material.dart';

import '../config/get_config.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(indent: 50, endIndent: 5)),
        Text(dividerText, style: TextStyle(fontSize: 14)),
        const Flexible(child: Divider(indent: 5, endIndent: 50)),
      ],
    );
  }
}

class OtherLogInOptions extends StatelessWidget {
  const OtherLogInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInIconButtonPalate(iconPath: 'assets/logos/google.png'),
        SignInIconButtonPalate(iconPath: 'assets/logos/phone.png'),
      ],
    );
  }
}

class SignInIconButtonPalate extends StatelessWidget {
  const SignInIconButtonPalate({super.key, required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(onPressed: () {}, icon: Image.asset(iconPath, width: 20, height: 20));
  }
}

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -140,
      left: -200,
      right: -200,
      child: Container(
        height: 700,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000), color: getColorScheme(context).inversePrimary),
      ),
    );
  }
}
