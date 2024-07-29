import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/favorites/components/favorite_gridview.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  final int cnt = 35;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(11, 3, 10, 2),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorite Items ($cnt)",
            style: getTextTheme(context).titleLarge?.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Divider(color: getColorScheme(context).outline),
          const SizedBox(height: 5),
          const FavoriteGridview(),
        ],
      ),
    );
  }
}
