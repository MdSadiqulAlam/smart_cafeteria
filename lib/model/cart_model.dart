class CartItemIds {
  @override
  String toString() {
    return 'CartItem(itemId: $itemId, quantity: $quantity)';
  }

  String itemId;
  int quantity;

  CartItemIds({required this.itemId, required this.quantity});

  // Convert CartItem to a Map (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'quantity': quantity,
    };
  }

  // Create a CartItem from a Map
  factory CartItemIds.fromJson(Map<String, dynamic> json) {
    return CartItemIds(
      itemId: json['itemId'],
      quantity: json['quantity'],
    );
  }
}

class CartModel {
  @override
  String toString() {
    return 'CartModel(totalItems: ${totalItems()}, cartItems: $cartItems)';
  }

  List<CartItemIds> cartItems;

  CartModel({required this.cartItems});

  static CartModel empty()=>CartModel(cartItems: []);

  // Convert CartItemModel to a Map (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
    };
  }

  // Create a CartItemModel from a Map
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartItems: (json['cartItems'] as List).map((item) => CartItemIds.fromJson(item)).toList(),
    );
  }

  // Calculate total items in the cart
  int totalItems() {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }

  // Add an item to the cart
  void addItem(CartItemIds newItem) {
    // Check if the item is already in the cart
    final index = cartItems.indexWhere((item) => item.itemId == newItem.itemId);
    if (index >= 0) {
      // If the item is already in the cart, update the quantity
      cartItems[index].quantity += newItem.quantity;
    } else {
      // If not, add the new item to the list
      // cartItems.add(newItem);
      // If not, add the new item at the beginning of the list
      cartItems.insert(0, newItem);
    }
  }

  // Remove an item from the cart
  void removeItem(String itemId) {
    cartItems.removeWhere((item) => item.itemId == itemId);
  }

  // Update item quantity in the cart
  void updateItemQuantity(String itemId, int quantity) {
    final index = cartItems.indexWhere((item) => item.itemId == itemId);
    if (index >= 0) {
      cartItems[index].quantity = quantity;
    }
  }

  // Calculate total price (requires a function to fetch item price)
  double calculateTotalPrice(Map<String, double> itemPrices) {
    return cartItems.fold(0.0, (total, item) {
      final price = itemPrices[item.itemId] ?? 0.0;
      return total + price * item.quantity;
    });
  }
}
