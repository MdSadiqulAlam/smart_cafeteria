import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/model/order_data.dart';
import 'package:smart_cafeteria/model/user_order_data.dart';
import 'package:smart_cafeteria/model/user_order_model.dart';
import 'package:smart_cafeteria/pages/cart/components/cart_controller.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

class OrderController extends GetxController with GetSingleTickerProviderStateMixin {
  static OrderController get instance => Get.find();

  /// Observables
  var userOrder = UserOrderModel.empty().obs; // Observable instance of UserOrderModel
  var pendingOrders = <OrderModel>[].obs; // Observable list of pending orders
  var completedOrders = <OrderModel>[].obs; // Observable list of completed orders
  var isLoading = false.obs;

  /// Data Services
  final userOrderData = UserOrderData(); // UserOrder data service
  final pendingOrderData = PendingOrdersData(); // PendingOrder data service
  final completedOrderData = CompletedOrdersData(); // CompletedOrder data service

  @override
  void onInit() {
    super.onInit();
    fetchUserOrders(); // Fetch orders immediately on initialization
    // Listen for real-time updates on user order
    userOrderData.listenForUserOrderUpdates((updatedUserOrder) {
      userOrder.value = updatedUserOrder; // Update the observable with the new user order
      fetchUserOrders(); // Fetch pending and completed orders after user order updates
    });
  }

  /// Fetch user orders (pending and completed) and update lists
  Future<void> fetchUserOrders() async {
    isLoading.value = true;
    try {
      // Fetch user order data and update userOrder.value
      userOrder.value = await userOrderData.fetchUserOrderData();

      // Fetch pending and completed orders based on userOrder
      await fetchPendingOrders();
      await fetchCompletedOrders();

      // Call filterOrders to set the initial filtered orders
      // filterOrders();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error fetching user orders: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch pending orders from Firestore using userOrder's pendingOrderIds
  Future<void> fetchPendingOrders() async {
    try {
      final pendingOrdersList = <OrderModel>[];
      for (String orderId in userOrder.value.pendingOrderIds) {
        final order = await pendingOrderData.fetchPendingOrderById(orderId);
        // pendingOrdersList.add(order);
        pendingOrdersList.insert(0, order);
      }
      pendingOrders.value = pendingOrdersList; // Update pendingOrders list
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error fetching pending orders: $e");
    }
  }

  /// Fetch completed orders from Firestore using userOrder's completedOrderIds
  Future<void> fetchCompletedOrders() async {
    try {
      final completedOrdersList = <OrderModel>[];
      for (String orderId in userOrder.value.completedOrderIds) {
        final order = await completedOrderData.fetchCompletedOrderById(orderId);
        // completedOrdersList.add(order);
        completedOrdersList.insert(0, order);
      }
      completedOrders.value = completedOrdersList; // Update completedOrders list
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error fetching completed orders: $e");
    }
  }

  /// Place a new order (add to pending orders)
  Future<void> placeOrder() async {
    isLoading.value = true;
    try {
      // Create a new order using items from CartController
      final cartItems = CartController.instance.cartItems; // Get items from the cart

      final orderedItems = cartItems.map((item) {
        // Get the quantity for the item using ItemDisplayController
        int quantity = ItemDisplayController.instance.getItemQuantity(item.id);

        return OrderedItemModel(
          itemId: item.id,
          name: item.name,
          itemDetail: item.itemDetail,
          quantity: quantity,
          itemPrice: item.price,
          imagePath: item.imagePath,
          kcal: item.kcal, // Assuming that item.kcal is available in the item model
        );
      }).toList();

      // Calculate total kcal for the entire order
      final num totalKcal = orderedItems.fold(0, (total, item) => total + (item.kcal * item.quantity));
      // Get the current logged-in user's ID
      final currentUser = FirebaseAuth.instance.currentUser;
      final userId = currentUser != null ? currentUser.uid : '';

      // Create a new order model with Firestore ID being auto-assigned
      final newOrder = OrderModel(
        id: '',
        userId: userId,
        completed: false,
        orderDate: DateTime.now(),
        totalPaid: orderedItems.fold(0, (total, item) => total + (item.itemPrice * item.quantity)),
        totalItem: orderedItems.fold(0, (total, item) => total + item.quantity.toInt()),
        orderedItems: orderedItems,
        // List of ordered items
        totalKcal: totalKcal, // Total kcal for the order
      );

      // Save the order to the pending orders collection
      final orderId = await pendingOrderData.savePendingOrder(newOrder);

      // Add the generated order ID to the user's pending orders list
      await userOrderData.addPendingOrder(orderId);

      // Clear the cart after placing the order
      await ItemDisplayController.instance.clearCart();

      // Fetch the latest user orders
      await fetchUserOrders();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error placing order: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Move an order from pending to completed
  Future<void> moveOrderToCompleted(OrderModel order) async {
    isLoading.value = true;
    try {
      // Move the order from Pending to Completed collection
      await pendingOrderData.moveToCompleted(order);

      // Update user's order data (remove from pending, add to completed)
      await userOrderData.completeOrder(order.id);

      // Fetch latest orders
      await fetchUserOrders();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error moving order to completed: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete an order (if needed)
  Future<void> deleteOrder(String orderId) async {
    isLoading.value = true;
    try {
      // Remove from Firestore pending orders
      await pendingOrderData.deletePendingOrder(orderId);

      // Update the user order data by removing the order from pending list
      await fetchUserOrders();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: "Error deleting order: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
