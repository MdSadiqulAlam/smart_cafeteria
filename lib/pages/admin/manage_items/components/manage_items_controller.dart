import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/test/item_model.dart';

class ManageItemsController extends GetxController with GetSingleTickerProviderStateMixin {
  static ManageItemsController get instance => Get.find();

  /// variables
  late final TabController tabController;
  final searchItem = TextEditingController();
  var filteredItems = <ItemModel>[].obs;

  List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      filterItems(); // Call filterItems whenever the tab is switched
    });
    filterItems(); // Call filterItems initially to load all items
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void filterItems() {
    // Get.to(const LoadingScreen(transparent: true));
    if (tabController.index == 0) {
      // If the index is 0, show all items
      filteredItems.value = allItems;
    } else {
      // Filter items based on the category of the selected tab
      String selectedCategory = categories[tabController.index - 1];
      filteredItems.value = allItems.where((item) => item.category.contains(selectedCategory)).toList();
    }
    // Get.back();
  }
}
