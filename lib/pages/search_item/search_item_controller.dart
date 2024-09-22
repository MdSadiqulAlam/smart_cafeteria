import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';

class SearchItemController extends GetxController {
  // static SearchItemController get instance => Get.find();

  /// Search query controller
  final searchController = TextEditingController();

  /// Observable list of filtered items
  var filteredItems = <ItemModel>[].obs;

  /// Observable for loading state
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with no filtered items initially displayed
    filteredItems.clear();

    // Listen to search query changes and filter items
    searchController.addListener(() {
      searchItems(searchController.text);
    });
  }

  /// Filter items based on the search query with loading and error handling
  void searchItems(String query) async {
    try {
      isLoading.value = true;

      // Clear the filtered items when the query is empty
      if (query.isEmpty) {
        filteredItems.clear();
      } else {
        final allItems = ItemDisplayController.instance.allItems;

        // Filter items based on the query
        filteredItems.value = allItems
            .where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.itemDetail.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    } catch (e) {
      // Handle any error that occurs during search
      Get.snackbar('Error', 'Failed to search items: $e');
    } finally {
      isLoading.value = false; // Set loading to false after search is done
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
