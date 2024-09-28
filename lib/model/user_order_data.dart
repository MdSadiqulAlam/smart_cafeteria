import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_order_model.dart';

class UserOrderData {
  final collection = FirebaseFirestore.instance.collection('UserOrders');
  final user = FirebaseAuth.instance.currentUser;  // Global user instance

  /// Fetch the user's order data from Firestore
  Future<UserOrderModel> fetchUserOrderData() async {
    if (user == null) return UserOrderModel.empty();

    try {
      final document = await collection.doc(user!.uid).get();
      return document.exists
          ? UserOrderModel.fromSnapshot(document)
          : UserOrderModel.empty();
    } catch (e) {
      throw "Error fetching user orders: $e";
    }
  }

  /// Update the user's order data (pending/completed orders)
  Future<void> updateUserOrderData(UserOrderModel userOrder) async {
    if (user == null) throw "User not logged in.";  // Check if the user is logged in

    try {
      await collection.doc(user!.uid).set(userOrder.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw "Error updating user orders: $e";
    }
  }

  /// Add a pending order to the user's data
  Future<void> addPendingOrder(String orderId) async {
    if (user == null) throw "User not logged in.";  // Check if the user is logged in

    try {
      final userOrder = await fetchUserOrderData();
      final updatedUserOrder = userOrder.copyWith(
        pendingOrderIds: [...userOrder.pendingOrderIds, orderId],
      );
      await updateUserOrderData(updatedUserOrder);
    } catch (e) {
      throw "Error adding pending order: $e";
    }
  }

  /// Move order from pending to completed
  Future<void> completeOrder(String orderId) async {
    if (user == null) throw "User not logged in.";  // Check if the user is logged in

    try {
      final userOrder = await fetchUserOrderData();
      if (!userOrder.pendingOrderIds.contains(orderId)) {
        throw "Order not found in pending orders";
      }

      final updatedUserOrder = userOrder.copyWith(
        pendingOrderIds: userOrder.pendingOrderIds..remove(orderId),
        completedOrderIds: [...userOrder.completedOrderIds, orderId],
      );
      await updateUserOrderData(updatedUserOrder);
    } catch (e) {
      throw "Error completing order: $e";
    }
  }
}
