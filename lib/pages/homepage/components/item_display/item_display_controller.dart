import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/model/favorite_data.dart';

class ItemDisplayController extends GetxController {
  static ItemDisplayController get instance => Get.find();

  /// Variables
  var allItems = <ItemModel>[].obs; // All items fetched from Firestore
  var favoriteItemIds = <String>[].obs; // Favorite items of the user (list of item IDs)
  var isLoading = false.obs;

  /// Item repository
  final itemData = ItemData(); // Create an instance of ItemData for Firestore operations
  final favoriteData = FavoriteData(); // Firestore operations for favorite items

  @override
  void onInit() {
    super.onInit();
    fetchItemsFromFirestore(); // Fetch items from Firestore on initialization
    fetchFavoriteItems(); // Fetch favorite items
    listenForItemUpdates(); // Listen for real-time updates when items are added or modified
    // listenForFavoriteUpdates(); // Listen for real-time updates to the user's favorites
  }

  /// Fetch items from Firestore
  Future<void> fetchItemsFromFirestore() async {
    try {
      isLoading.value = true;
      final fetchedItems = await itemData.fetchAllItems();
      allItems.value = fetchedItems; // Update the list of items
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Error fetching items: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch the user's favorite items
  Future<void> fetchFavoriteItems() async {
    try {
      isLoading.value = true;
      final favoriteModel = await favoriteData.fetchUserFavorites();
      // Update favoriteItems with the list of favorite item IDs
      favoriteItemIds.value = favoriteModel.favoriteItems;
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Error fetching favorite items: $e');
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

  /// Listen for real-time updates to the user's favorite items
  // void listenForFavoriteUpdates() {
  //   if (favoriteData.user == null) return;
  //
  //   favoriteData.collection.doc(favoriteData.user!.uid).snapshots().listen((snapshot) {
  //     if (snapshot.exists) {
  //       // If there is a change in the user's favorites, update the list
  //       final favoriteModel = FavoriteModel.fromSnapshot(snapshot);
  //       favoriteItems.value = favoriteModel.favoriteItems;
  //     } else {
  //       // If the document doesn't exist, clear the favorite items list
  //       favoriteItems.clear();
  //     }
  //   });
  // }

  /// Check if an item is a favorite
  bool isItemFavorite(String itemId) {
    return favoriteItemIds.contains(itemId);
  }

  /// Add an item to the user's favorites
  Future<void> addFavorite(String itemId) async {
    try {
      await favoriteData.addFavoriteItem(itemId);
      favoriteItemIds.add(itemId);
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to add favorite: $e');
    }
  }

  /// Remove an item from the user's favorites
  Future<void> removeFavorite(String itemId) async {
    try {
      await favoriteData.removeFavoriteItem(itemId);
      favoriteItemIds.remove(itemId);
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to remove favorite: $e');
    }
  }
}
