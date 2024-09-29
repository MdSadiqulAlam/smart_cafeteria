import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_order_model.dart';

class UserOrderData {
  final collection = FirebaseFirestore.instance.collection('UserOrders');
  final currentUser = FirebaseAuth.instance.currentUser; // Global user instance

  /// Fetch the user's order data from Firestore
  Future<UserOrderModel> fetchUserOrderData({String? userId}) async {
    final uid = userId ?? currentUser?.uid;
    if (uid == null) return UserOrderModel.empty(); // Handle no user case

    try {
      final document = await collection.doc(uid).get();
      return document.exists ? UserOrderModel.fromSnapshot(document) : UserOrderModel.empty();
    } catch (e) {
      throw "Error fetching user orders: $e";
    }
  }

  /// Listen for real-time updates in the user's order data
  void listenForUserOrderUpdates(Function(UserOrderModel) onUpdate) {
    final uid = currentUser?.uid;
    if (uid == null) {
      throw "User not logged in."; // Handle the case where user is not logged in
    }

    collection.doc(uid).snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final userOrder = UserOrderModel.fromSnapshot(snapshot);
        onUpdate(userOrder); // Call the provided callback with the updated user order
      } else {
        onUpdate(UserOrderModel.empty()); // Handle case when user order document does not exist
      }
    });
  }

  /// Update the user's order data (pending/completed orders)
  Future<void> updateUserOrderData(UserOrderModel userOrder, {String? userId}) async {
    final uid = userId ?? currentUser?.uid;
    if (uid == null) throw "User not logged in."; // Check if the user is logged in

    try {
      await collection.doc(uid).set(userOrder.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw "Error updating user orders: $e";
    }
  }

  /// Add a pending order to the user's data
  Future<void> addPendingOrder(String orderId, {String? userId}) async {
    final uid = userId ?? currentUser?.uid;
    if (uid == null) throw "User not logged in."; // Check if the user is logged in

    try {
      final userOrder = await fetchUserOrderData(userId: uid);
      final updatedUserOrder = userOrder.copyWith(
        pendingOrderIds: [...userOrder.pendingOrderIds, orderId],
      );
      await updateUserOrderData(updatedUserOrder, userId: uid);
    } catch (e) {
      throw "Error adding pending order: $e";
    }
  }

  /// Move order from pending to completed
  Future<void> completeOrder(String orderId, {String? userId}) async {
    final uid = userId ?? currentUser?.uid;
    if (uid == null) throw "User not logged in."; // Check if the user is logged in

    try {
      final userOrder = await fetchUserOrderData(userId: uid);
      if (!userOrder.pendingOrderIds.contains(orderId)) {
        throw "Order not found in pending orders";
      }

      final updatedUserOrder = userOrder.copyWith(
        pendingOrderIds: userOrder.pendingOrderIds..remove(orderId),
        completedOrderIds: [...userOrder.completedOrderIds, orderId],
      );
      await updateUserOrderData(updatedUserOrder, userId: uid);
    } catch (e) {
      throw "Error completing order: $e";
    }
  }
}
