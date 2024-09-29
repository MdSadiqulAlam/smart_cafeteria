import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_cafeteria/model/cart_model.dart';

class CartData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  // Firestore collection reference for the cart
  CollectionReference get _cartCollection => _firestore.collection('Carts');

  /// Get cart data for the current user
  Future<CartModel?> getCart() async {
    if (user == null) return CartModel(cartItems: []);

    try {
      final doc = await _cartCollection.doc(user!.uid).get();
      if (doc.exists && doc.data() != null) {
        // Parse the document data into a CartModel
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Check if cartItems exists in data, if not, assign an empty list
        if (!data.containsKey('cartItems') || data['cartItems'] == null) {
          return CartModel.empty();
        }

        final cart = CartModel.fromJson(data);

        return cart;
      } else {
        return CartModel.empty();
      }
    } catch (e) {
      print('Error fetching cart: $e');
    }
    return CartModel.empty();
  }

  /// Add an item to the cart
  Future<void> addItemToCart(CartItemIds item) async {
    if (user == null) throw "User not logged in.";

    try {
      final cart = await getCart();
      final updatedCart = cart ?? CartModel(cartItems: []);
      updatedCart.addItem(item);
      await _cartCollection.doc(user!.uid).set(updatedCart.toJson());
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }

  /// Remove an item from the cart
  Future<void> removeItemFromCart(String itemId) async {
    if (user == null) throw "User not logged in.";

    try {
      final cart = await getCart();
      if (cart != null) {
        cart.removeItem(itemId);

        await _cartCollection.doc(user!.uid).set(cart.toJson());
      }
    } catch (e) {
      print('Error removing item from cart: $e');
    }
  }

  /// Update item quantity in the cart
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    if (user == null) throw "User not logged in.";

    try {
      final cart = await getCart();
      if (cart != null) {
        cart.updateItemQuantity(itemId, quantity);

        await _cartCollection.doc(user!.uid).set(cart.toJson());
      }
    } catch (e) {
      print('Error updating item quantity: $e');
    }
  }

  /// Delete specific fields from the cart document
  Future<void> deleteCartField(String fieldName) async {
    if (user == null) throw "User not logged in.";
    // await cartData.deleteCartField('cartItems');

    try {
      // Update the document to remove the specified field
      await _cartCollection.doc(user!.uid).update({
        fieldName: FieldValue.delete(),
      });
    } catch (e) {
      print('Error deleting field from cart: $e');
    }
  }
}
