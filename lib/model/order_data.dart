import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_cafeteria/model/order_model.dart';

class PendingOrdersData {
  final collection = FirebaseFirestore.instance.collection('PendingOrders');

  /// Save a new pending order to Firestore
  Future<String> savePendingOrder(OrderModel order) async {
    try {
      // Add the order to the collection and get the document reference
      final docRef = await collection.add(order.toJson());

      // Return the document ID of the newly added order
      return docRef.id;
    } catch (e) {
      throw "Error saving pending order: $e";
    }
  }

  /// Update an existing pending order in Firestore
  Future<void> updatePendingOrder(OrderModel order) async {
    try {
      await collection.doc(order.id).update(order.toJson());
    } catch (e) {
      throw "Error updating pending order: $e";
    }
  }

  /// Delete a pending order from Firestore
  Future<void> deletePendingOrder(String orderId) async {
    try {
      await collection.doc(orderId).delete();
    } catch (e) {
      throw "Error deleting pending order: $e";
    }
  }

  /// Fetch all pending orders from Firestore
  Future<List<OrderModel>> fetchAllPendingOrders() async {
    try {
      final snapshot = await collection.orderBy('orderDate', descending: true).get();
      return snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw "Error fetching pending orders: $e";
    }
  }

  /// Fetch a single pending order by ID
  Future<OrderModel> fetchPendingOrderById(String orderId) async {
    try {
      final document = await collection.doc(orderId).get();
      return OrderModel.fromSnapshot(document);
    } catch (e) {
      throw "Error fetching pending order: $e";
    }
  }

  /// Move order from Pending to Completed (by deleting from Pending and adding to Completed)
  Future<void> moveToCompleted(OrderModel order) async {
    try {
      await deletePendingOrder(order.id); // Remove from PendingOrders
      await CompletedOrdersData().updateToCompletedOrder(order); // Save to CompletedOrders with the same order ID
    } catch (e) {
      throw "Error moving order to completed: $e";
    }
  }
}

class CompletedOrdersData {
  final collection = FirebaseFirestore.instance.collection('CompletedOrders');

  /// Save a completed order to Firestore
  Future<void> saveCompletedOrder(OrderModel order) async {
    try {
      await collection.add(order.toJson());
    } catch (e) {
      throw "Error saving completed order: $e";
    }
  }

  /// Update (or create) a completed order with the same order ID from PendingOrders
  Future<void> updateToCompletedOrder(OrderModel order) async {
    try {
      // Set the document in CompletedOrders using the same order ID
      await collection.doc(order.id).set(order.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw "Error updating completed order: $e";
    }
  }

  /// Fetch all completed orders from Firestore
  Future<List<OrderModel>> fetchAllCompletedOrders() async {
    try {
      final snapshot = await collection.orderBy('orderDate', descending: true).get();
      return snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw "Error fetching completed orders: $e";
    }
  }

  /// Fetch a single completed order by ID
  Future<OrderModel> fetchCompletedOrderById(String orderId) async {
    try {
      final document = await collection.doc(orderId).get();
      return OrderModel.fromSnapshot(document);
    } catch (e) {
      throw "Error fetching completed order: $e";
    }
  }

  /// Update a completed order (if necessary)
  Future<void> updateCompletedOrder(OrderModel order) async {
    try {
      await collection.doc(order.id).update(order.toJson());
    } catch (e) {
      throw "Error updating completed order: $e";
    }
  }

  /// Delete a completed order (if necessary)
  Future<void> deleteCompletedOrder(String orderId) async {
    try {
      await collection.doc(orderId).delete();
    } catch (e) {
      throw "Error deleting completed order: $e";
    }
  }
}
