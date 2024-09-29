import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/model/order_data.dart';

class OrdersAdminController extends GetxController {
  static OrdersAdminController get instance => Get.find();

  var pendingOrders = <OrderModel>[].obs;
  var completedOrders = <OrderModel>[].obs;
  var isLoading = false.obs;

  final PendingOrdersData pendingOrdersData = PendingOrdersData();
  final CompletedOrdersData completedOrdersData = CompletedOrdersData();

  @override
  void onInit() {
    super.onInit();
    // Fetch the initial list of orders
    loadInitialOrders();

    // Listen for real-time updates after loading the initial data
    listenToPendingOrders();
    listenToCompletedOrders();
  }

  /// Load initial orders from Firestore and set up real-time listeners
  Future<void> loadInitialOrders() async {
    try {
      isLoading.value = true;
      // Fetch initial pending and completed orders
      await fetchPendingOrders();
      await fetchCompletedOrders();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh snap!', message: "Error loading initial orders: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch pending orders from Firestore
  Future<void> fetchPendingOrders() async {
    try {
      final pendingList = await pendingOrdersData.fetchAllPendingOrders();
      pendingOrders.value = pendingList;
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh snap!', message: "Error fetching pending orders: $e");
    }
  }

  /// Fetch completed orders from Firestore
  Future<void> fetchCompletedOrders() async {
    try {
      final completedList = await completedOrdersData.fetchAllCompletedOrders();
      completedOrders.value = completedList;
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh snap!', message: "Error fetching completed orders: $e");
    }
  }

  /// Listen for real-time updates for pending orders using document changes
  void listenToPendingOrders() {
    FirebaseFirestore.instance.collection('PendingOrders').orderBy('orderDate', descending: true).snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        final updatedOrder = OrderModel.fromSnapshot(change.doc);

        if (change.type == DocumentChangeType.added) {
          // Add the new order to the list
          pendingOrders.add(updatedOrder);
        } else if (change.type == DocumentChangeType.modified) {
          // Find the index of the modified order and update it
          int index = pendingOrders.indexWhere((order) => order.id == updatedOrder.id);
          if (index != -1) {
            pendingOrders[index] = updatedOrder;
          }
        } else if (change.type == DocumentChangeType.removed) {
          // Remove the order from the list when it is deleted from Firestore
          pendingOrders.removeWhere((order) => order.id == updatedOrder.id);
        }
      }
    });
  }

  /// Listen for real-time updates for completed orders using document changes
  void listenToCompletedOrders() {
    FirebaseFirestore.instance
        .collection('CompletedOrders')
        .orderBy('orderDate', descending: true)
        .snapshots()
        .listen((snapshot) {
      for (var change in snapshot.docChanges) {
        final updatedOrder = OrderModel.fromSnapshot(change.doc);

        if (change.type == DocumentChangeType.added) {
          // Add the new order to the list
          completedOrders.add(updatedOrder);
        } else if (change.type == DocumentChangeType.modified) {
          // Find the index of the modified order and update it
          int index = completedOrders.indexWhere((order) => order.id == updatedOrder.id);
          if (index != -1) {
            completedOrders[index] = updatedOrder;
          }
        } else if (change.type == DocumentChangeType.removed) {
          // Remove the order from the list when it is deleted from Firestore
          completedOrders.removeWhere((order) => order.id == updatedOrder.id);
        }
      }
    });
  }

  /// Mark an order as completed
  Future<void> markOrderAsCompleted(OrderModel order) async {
    try {
      isLoading.value = true;
      await pendingOrdersData.moveToCompleted(order);
    } catch (e) {
      print("Error marking order as completed: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete a pending order by ID
  Future<void> deletePendingOrder(String orderId) async {
    try {
      isLoading.value = true;
      await pendingOrdersData.deletePendingOrder(orderId);
    } catch (e) {
      print("Error deleting pending order: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete a completed order by ID
  Future<void> deleteCompletedOrder(String orderId) async {
    try {
      isLoading.value = true;
      await completedOrdersData.deleteCompletedOrder(orderId);
    } catch (e) {
      print("Error deleting completed order: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch a pending order by ID
  Future<OrderModel?> fetchPendingOrderById(String orderId) async {
    try {
      return await pendingOrdersData.fetchPendingOrderById(orderId);
    } catch (e) {
      print("Error fetching pending order: $e");
      return null;
    }
  }

  /// Fetch a completed order by ID
  Future<OrderModel?> fetchCompletedOrderById(String orderId) async {
    try {
      return await completedOrdersData.fetchCompletedOrderById(orderId);
    } catch (e) {
      print("Error fetching completed order: $e");
      return null;
    }
  }
}
