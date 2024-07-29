import 'package:flutter/material.dart';

import '../../config/get_config.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.title, required this.subtitle, required this.imagePath});

  final String title, subtitle, imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: getScreenWidth(context) * 0.7, height: getScreenWidth(context) * 0.7),
              const SizedBox(height: 40),
              Text(
                title,
                style: getTextTheme(context).headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: getColorScheme(context).onPrimaryContainer,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                subtitle,
                style: getTextTheme(context).bodyLarge?.copyWith(color: getColorScheme(context).onPrimaryContainer),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
