import 'package:cloud_firestore/cloud_firestore.dart';

/// Model representing the user's list of favorite item IDs
class FavoriteModel {
  List<String> favoriteItems;

  FavoriteModel({
    required this.favoriteItems,
  });

  /// Convert model to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'FavoriteItems': favoriteItems,
    };
  }

  /// Factory method to create FavoriteModel from Firestore snapshot
  factory FavoriteModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return FavoriteModel(
        favoriteItems: List<String>.from(data['FavoriteItems'] ?? []),
      );
    }
    return FavoriteModel(favoriteItems: []);
  }
}
