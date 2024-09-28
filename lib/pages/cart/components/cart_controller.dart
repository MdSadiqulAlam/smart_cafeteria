import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Observables
  var cartItems = <ItemModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initial load of cart items
    updateCartItems();

    // Listen for changes in the cart and update cartItems accordingly
    ever(ItemDisplayController.instance.myCart, (_) {
      updateCartItems();
    });
  }

  /// Update cartItems based on the myCart from ItemDisplayController
  // Future<void> updateCartItems() async {
  //   try {
  //     isLoading.value = true;
  //     final cartModel = ItemDisplayController.instance.myCart.value;
  //     final allItems = ItemDisplayController.instance.allItems;
  //
  //     cartItems.value = cartModel.cartItems
  //         .map((cartItem) => allItems.firstWhere((item) => item.id == cartItem.itemId, orElse: () => ItemModel.empty()))
  //         .where((item) => item.id != '')
  //         .toList();
  //   } catch (e) {
  //     MyLoadingWidgets.errorSnackBar(title: 'Error on cart page', message: "Failed to update cart items: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Update cartItems based on the myCart from ItemDisplayController
  Future<void> updateCartItems() async {
    try {
      isLoading.value = true;
      final cartModel = ItemDisplayController.instance.myCart.value;
      final allItems = ItemDisplayController.instance.allItems;

      // Temporary list to store valid items
      final validItems = <ItemModel>[];

      for (var cartItem in cartModel.cartItems) {
        final item = allItems.firstWhere((item) => item.id == cartItem.itemId, orElse: () => ItemModel.empty());

        if (item.id != '') {
          validItems.add(item); // Add valid item to the list
        } else {
          // Remove the item from the backend if it's not found
          await ItemDisplayController.instance.removeItemFromCart(cartItem.itemId);
        }
      }

      // Update cartItems with valid items
      cartItems.value = validItems;
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error on cart page', message: "Failed to update cart items: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Get the total price for an individual item based on its quantity in the cart
  num getItemTotalPrice(String itemId) {
    final item = cartItems.firstWhere((item) => item.id == itemId, orElse: () => ItemModel.empty());
    if (item.id == '') return 0.0; // Item not found in cart
    final quantity = ItemDisplayController.instance.getItemQuantity(itemId);
    return item.price * quantity;
  }

  // Get the total price of all items in the cart (alternative to totalPrice)
  num getTotalPrice() {
    return cartItems.fold(0, (sum, item) {
      final quantity = ItemDisplayController.instance.getItemQuantity(item.id);
      return sum + (item.price * quantity);
    });
  }

  // Get the total calories of all items in the cart
  num getTotalCalories() {
    return cartItems.fold(0, (sum, item) {
      final quantity = ItemDisplayController.instance.getItemQuantity(item.id);
      return sum + (item.kcal * quantity);
    });
  }
}
