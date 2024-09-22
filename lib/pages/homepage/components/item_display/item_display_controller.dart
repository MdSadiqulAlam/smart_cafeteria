import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/model/item_model.dart';

class ItemDisplayController extends GetxController {
  static ItemDisplayController get instance => Get.find();

  /// Variables
  var allItems = <ItemModel>[].obs; // All items fetched from Firestore
  var isLoading = false.obs;

  /// Item repository
  final itemData = ItemData(); // Create an instance of ItemData for Firestore operations

  @override
  void onInit() {
    super.onInit();
    fetchItemsFromFirestore(); // Fetch items from Firestore on initialization
    listenForItemUpdates(); // Listen for real-time updates when items are added or modified
  }

  /// Fetch items from Firestore
  Future<void> fetchItemsFromFirestore() async {
    try {
      isLoading.value = true;
      final fetchedItems = await itemData.fetchAllItems();
      allItems.value = fetchedItems; // Update the list of items
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!',message: 'Error fetching items: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Listen for real-time updates in Firestore
  void listenForItemUpdates() {
    itemData.collection.snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        final updatedItem = ItemModel.fromSnapshot(change.doc);

        if (change.type == DocumentChangeType.added || change.type == DocumentChangeType.modified) {
          // Find the index of the updated item, if it already exists in the list
          int index = allItems.indexWhere((item) => item.id == updatedItem.id);

          if (index != -1) {
            // Update the existing item in the list
            allItems[index] = updatedItem;
          } else {
            // Add the new item to the list
            allItems.add(updatedItem);
          }
        } else if (change.type == DocumentChangeType.removed) {
          // Remove the item from the list when it is deleted from Firestore
          allItems.removeWhere((item) => item.id == updatedItem.id);
        }
      });
    });
  }
}
