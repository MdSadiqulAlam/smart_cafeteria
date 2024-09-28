import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/favorite_data.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

class FavoriteIconButtonItemDetail extends StatelessWidget {
  const FavoriteIconButtonItemDetail({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    // Use ItemDisplayController to manage favorite status
    final itemDisplayController = ItemDisplayController.instance;
    // Check if the item is in the user's favorites
    final isFavorite = itemDisplayController.favoriteItemIds.contains(itemId).obs;
    final favoriteData = FavoriteData();

    return Obx(
      () => IconButton.filledTonal(
        onPressed: () async {
          try {
            if (isFavorite.value) {
              // Remove item from favorites in Firestore and update locally
              await favoriteData.removeFavoriteItem(itemId);
              itemDisplayController.favoriteItemIds.remove(itemId);
            } else {
              // Add item to favorites in Firestore and update locally
              await favoriteData.addFavoriteItem(itemId);
              itemDisplayController.favoriteItemIds.add(itemId);
            }
            isFavorite.value = !isFavorite.value; // Toggle the observable value
          } catch (e) {
            MyLoadingWidgets.errorSnackBar(
              title: 'Oh Snap!',
              message: 'Error updating favorite status: $e',
            );
          }
        },
        icon: Icon(
          isFavorite.value ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: Theme.of(context).colorScheme.error,
          size: isFavorite.value ? 24 : 21,
        ),
      ),
    );
  }
}
