import 'package:cloud_firestore/cloud_firestore.dart';

class UserOrderModel {
  final List<String> pendingOrderIds;
  final List<String> completedOrderIds;

  UserOrderModel({
    required this.pendingOrderIds,
    required this.completedOrderIds,
  });

  /// Static function to create an empty UserOrderModel
  static UserOrderModel empty() => UserOrderModel(
        pendingOrderIds: [],
        completedOrderIds: [],
      );

  /// Convert model to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'pendingOrderIds': pendingOrderIds,
      'completedOrderIds': completedOrderIds,
    };
  }

  /// Factory method to create UserOrderModel from a Firestore document
  factory UserOrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserOrderModel(
        pendingOrderIds: List<String>.from(data['pendingOrderIds'] ?? []),
        completedOrderIds: List<String>.from(data['completedOrderIds'] ?? []),
      );
    }
    return UserOrderModel.empty();
  }

  /// Copy with method
  UserOrderModel copyWith({
    List<String>? pendingOrderIds,
    List<String>? completedOrderIds,
  }) {
    return UserOrderModel(
      pendingOrderIds: pendingOrderIds ?? this.pendingOrderIds,
      completedOrderIds: completedOrderIds ?? this.completedOrderIds,
    );
  }
}
