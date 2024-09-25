import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/model/favorite_model.dart';

class FavoriteData {
  final collection = FirebaseFirestore.instance.collection('Favorites');
  final user = FirebaseAuth.instance.currentUser;

  /// Add item to favorites
  Future<void> addFavoriteItem(String itemId) async {
    if (user == null) throw "User not logged in.";

    try {
      final favoriteDoc = collection.doc(user!.uid);
      final snapshot = await favoriteDoc.get();

      if (snapshot.exists) {
        // Update the existing list with the new itemId
        await favoriteDoc.update({
          'FavoriteItems': FieldValue.arrayUnion([itemId])
        });
      } else {
        // Create a new document with the itemId
        await favoriteDoc.set(FavoriteModel(favoriteItems: [itemId]).toJson());
      }
    } catch (e) {
      throw "Error adding favorite item: $e";
    }
  }

  /// Remove item from favorites
  Future<void> removeFavoriteItem(String itemId) async {
    if (user == null) throw "User not logged in.";

    try {
      final favoriteDoc = collection.doc(user!.uid);

      // Check if the document exists before updating
      final snapshot = await favoriteDoc.get();
      if (snapshot.exists) {
        await favoriteDoc.update({
          'FavoriteItems': FieldValue.arrayRemove([itemId])
        });
      }
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error removing', message: "Error removing favorite item: $e");
    }
  }

  /// Fetch user's favorite items
  Future<FavoriteModel> fetchUserFavorites() async {
    // if (user == null) throw "User not logged in.";
    if (user == null) return FavoriteModel(favoriteItems: []);

    try {
      final favoriteDoc = await collection.doc(user!.uid).get();
      return FavoriteModel.fromSnapshot(favoriteDoc);
    } catch (e) {
      throw "Error fetching favorite items: $e";
    }
  }

  /// Check if an item is in the user's favorites
  Future<bool> isFavorite(String itemId) async {
    if (user == null) throw "User not logged in.";

    try {
      final favoriteDoc = await collection.doc(user!.uid).get();
      if (!favoriteDoc.exists) return false;

      final favorites = FavoriteModel.fromSnapshot(favoriteDoc);
      return favorites.favoriteItems.contains(itemId);
    } catch (e) {
      throw "Error checking favorite status: $e";
    }
  }
}
