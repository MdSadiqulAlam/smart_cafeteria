import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import '../../../../model/item_data.dart';

class ManageItemsController extends GetxController with GetSingleTickerProviderStateMixin {
  static ManageItemsController get instance => Get.find();

  /// Variables
  late final TabController tabController;
  final searchItem = TextEditingController();
  var allItems = <ItemModel>[].obs; // Store all items fetched from Firestore
  var filteredItems = <ItemModel>[].obs; // Filtered items for display
  var searchFilteredItems = <ItemModel>[].obs; // search filtering
  var isLoading = false.obs;

  List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];

  /// Item repository
  final itemData = ItemData(); // Create an instance of ItemData for Firestore operations

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      filterItems(); // Call filterItems whenever the tab is switched
    });
    searchItem.addListener(() {
      searchItems(searchItem.text); // Call searchItems whenever search input changes
    });
    fetchItemsFromFirestore(); // Fetch items from Firestore on initialization
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
    searchItem.dispose();
  }

  /// Fetch items from Firestore
  Future<void> fetchItemsFromFirestore() async {
    try {
      isLoading.value = true;
      final fetchedItems = await itemData.fetchAllItems();
      allItems.value = fetchedItems;
      filterItems(); // Filter items after fetching
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Failed to load items: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  /// Filter items based on selected tab
  Future<void> filterItems() async {
    try {
      isLoading.value = true;

      if (tabController.index == 0) {
        // Show all items when "All Items" tab is selected
        filteredItems.value = allItems;
      } else {
        // Filter items based on the category of the selected tab
        String selectedCategory = categories[tabController.index - 1];
        filteredItems.value = allItems.where((item) => item.category.contains(selectedCategory)).toList();
      }

      // Apply search on the filtered items
      searchItems(searchItem.text);
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Failed to filter items: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  /// Search items based on the query
  void searchItems(String query) {
    if (query.isEmpty) {
      // If search query is empty, display filtered items without further filtering
      searchFilteredItems.value = filteredItems;
      return;
    }

    // Perform search by filtering the already filtered items based on name or itemDetail
    searchFilteredItems.value = filteredItems
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) || item.itemDetail.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
