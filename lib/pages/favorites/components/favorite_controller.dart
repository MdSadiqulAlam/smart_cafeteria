import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

class FavoriteController extends GetxController {
  // Singleton instance
  static FavoriteController get instance => Get.find();
  var isLoading = false.obs;

  // Observables
  var favoriteItems = <ItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initial load of favorite items
    updateFavoriteItems();

    // Listen for changes in favorite item IDs and update favoriteItems accordingly
    ever(ItemDisplayController.instance.favoriteItemIds, (_) {
      updateFavoriteItems();
    });
  }

  /// Update favoriteItems based on the favoriteItemIds from ItemDisplayController
  Future<void> updateFavoriteItems() async {
    try {
      isLoading.value = true;

      final allItems = ItemDisplayController.instance.allItems;
      final favoriteItemIds = ItemDisplayController.instance.favoriteItemIds;

      // Temporary list to store valid items
      final validItems = <ItemModel>[];
      for (var favoriteId in favoriteItemIds) {
        final item = allItems.firstWhere((item) => item.id == favoriteId, orElse: () => ItemModel.empty());

        if (item.id != '') {
          validItems.add(item); // Add valid item to the list
        } else {
          // Remove the item from the backend if it's not found
          await ItemDisplayController.instance.removeFavorite(favoriteId);
        }
      }
      favoriteItems.value = validItems.reversed.toList();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error on favorites page', message: "Failed to update favorite items $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
