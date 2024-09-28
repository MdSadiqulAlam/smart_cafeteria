import 'package:get/get.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

import '../../../../components/loading_widgets.dart';

class CategoricalItemDisplayController extends GetxController {
  final String tag; // Filter tag, e.g., 'breakfast', 'beverage', etc.
  CategoricalItemDisplayController({required this.tag});

  // Variables
  var categoryItems = <ItemModel>[].obs; // Filtered items based on the tag
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    filterItemsByCategory(); // Filter items based on the provided tag
  }

  /// Filter items based on category
  void filterItemsByCategory() {
    isLoading.value = true;
    try {
      // Get all items from ItemDisplayController
      final allItemsList = ItemDisplayController.instance.allItems;

      // Filter the items where the tag is present in the category list
      final filteredItems = allItemsList.where((item) => item.category.contains(tag)).toList();
      categoryItems.value = filteredItems; // Update the list of filtered items
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Error filtering items by category: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
