import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/model/favorite_data.dart';
import 'package:smart_cafeteria/model/cart_model.dart';
import 'package:smart_cafeteria/model/cart_data.dart';

import '../../cart/components/cart_controller.dart';
import '../../favorites/components/favorite_controller.dart';
import '../../order_screens/orders/components/order_controller.dart';

class ItemDisplayController extends GetxController {
  static ItemDisplayController get instance => Get.find();

  /// Variables
  var allItems = <ItemModel>[].obs; // All items fetched from Firestore
  var favoriteItemIds = <String>[].obs; // Favorite items of the user (list of item IDs)
  var myCart = CartModel(cartItems: []).obs; // User's cart data
  var isLoading = false.obs;

  /// Item repository
  final itemData = ItemData(); // Create an instance of ItemData for Firestore operations
  final favoriteData = FavoriteData(); // Firestore operations for favorite items
  final cartData = CartData(); // Firestore operations for cart data

  @override
  void onInit() {
    super.onInit();

    /// order controller initiation
    // Get.put(OrderController());

    fetchItemsFromFirestore(); // Fetch items from Firestore on initialization
    fetchFavoriteItems(); // Fetch favorite items
    fetchCartItems(); // Fetch cart items
    listenForItemUpdates(); // Listen for real-time updates when items are added or modified
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

  /// Fetch the user's cart items
  Future<void> fetchCartItems() async {
    try {
      final cartModel = await cartData.getCart();
      // print(cartModel);
      if (cartModel != null) {
        myCart.value = cartModel;
      }
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: 'Error fetching cart items: $e');
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

  /// FAVORITE FAVORITE FAVORITE FAVORITE FAVORITE______________________________________________________________
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

  /// CART CART CART CART CART_________________________________________________________________________________
  /// Check if an item is in the cart
  bool isItemInCart(String itemId) {
    return myCart.value.cartItems.any((item) => item.itemId == itemId);
  }

  /// Get the quantity of an item in the cart
  int getItemQuantity(String itemId) {
    final cartItem = myCart.value.cartItems.firstWhereOrNull((item) => item.itemId == itemId);
    return cartItem?.quantity ?? 0;
  }

  /// Get the total number of items in the cart
  int get getTotalItemCount {
    return myCart.value.cartItems.fold(0, (totalCount, item) => totalCount + item.quantity);
  }

  /// Add an item to the cart
  Future<void> addItemToCart(String itemId, int quantity) async {
    try {
      await cartData.addItemToCart(CartItemIds(itemId: itemId, quantity: quantity));
      // Update the cart in the controller after adding item

      await fetchCartItems();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to add item to cart: $e');
    }
  }

  /// Remove an item from the cart
  Future<void> removeItemFromCart(String itemId) async {
    try {
      await cartData.removeItemFromCart(itemId);
      // Update the cart in the controller after removing item
      await fetchCartItems();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to remove item from cart: $e');
    }
  }

  /// Update the quantity of an item in the cart
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    try {
      await cartData.updateItemQuantity(itemId, quantity);
      // Update the cart in the controller after updating item quantity
      await fetchCartItems();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to update item quantity: $e');
    }
  }

  /// Clear all items from the user's cart
  Future<void> clearCart() async {
    try {
      await cartData.deleteCartField('cartItems');
      myCart.value = CartModel(cartItems: []);
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Failed to clear cart: $e');
    }
  }
}
