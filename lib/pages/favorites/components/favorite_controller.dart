import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';

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
      isLoading.value = true; // Start loading

      final allItems = ItemDisplayController.instance.allItems;
      final favoriteItemIds = ItemDisplayController.instance.favoriteItemIds;

      // Filter allItems to include only those items whose ID is in favoriteItemIds
      favoriteItems.value = allItems.where((item) => favoriteItemIds.contains(item.id)).toList();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error on favorites page', message: "Failed to update favorite items $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

}
