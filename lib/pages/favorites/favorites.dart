import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/favorites/components/favorite_gridview.dart';

int cnt = 35;

class Favorites extends StatelessWidget {
  const Favorites({super.key});

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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                  // fontWeight: FontWeight.w500,
                ),
          ),
          Divider(color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(height: 15),
          const FavoriteGridview(),
        ],
      ),
    );
  }
}
