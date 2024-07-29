import 'package:flutter/material.dart';

import '../../../config/get_config.dart';

class HomepageHeading extends StatelessWidget {
  const HomepageHeading({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 + 2, right: 10),
      child: Text(
        heading,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w600, fontSize: 19, color: getColorScheme(context).onSurface),
      ),
    );
  }
}
