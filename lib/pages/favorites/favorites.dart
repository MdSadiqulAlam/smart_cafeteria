import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/favorites/components/favorite_gridview.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

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
          Obx(
            () {
              return Text(
                "Favorite Items (${ItemDisplayController.instance.favoriteItemIds.length})",
                style: getTextTheme(context).titleLarge?.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
              );
            },
          ),
          Divider(color: getColorScheme(context).outline),
          const SizedBox(height: 5),
          const FavoriteGridview(),
        ],
      ),
    );
  }
}
