import 'package:cloud_firestore/cloud_firestore.dart';

class OrderedItemModel {
  const OrderedItemModel({
    required this.itemId,
    required this.name,
    required this.itemDetail,
    required this.quantity,
    required this.itemPrice,
    required this.imagePath,
    required this.kcal,
  });

  final String itemId;
  final String name;
  final String itemDetail;
  final num quantity;
  final num itemPrice;
  final String imagePath;
  final num kcal;

  // Method to create an empty instance
  static OrderedItemModel empty() =>
      const OrderedItemModel(itemId: '', name: '', itemDetail: '', quantity: 0, itemPrice: 0, imagePath: '', kcal: 0);

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'name': name,
      'itemDetail': itemDetail,
      'quantity': quantity,
      'itemPrice': itemPrice,
      'imagePath': imagePath,
      'kcal': kcal,
    };
  }

  factory OrderedItemModel.fromMap(Map<String, dynamic> data) {
    return OrderedItemModel(
      itemId: data['itemId'] ?? '',
      name: data['name'] ?? '',
      itemDetail: data['itemDetail'] ?? '',
      quantity: data['quantity'] ?? 0,
      itemPrice: data['itemPrice'] ?? 0,
      imagePath: data['imagePath'] ?? '',
      kcal: data['kcal'] ?? 0,
    );
  }
}

class OrderModel {
  OrderModel({
    required this.id,
    required this.completed,
    required this.orderDate,
    required this.totalPaid,
    required this.totalItem,
    required this.orderedItems,
    required this.totalKcal,
    required this.userId,
  });

  final String id;
  final bool completed;
  final DateTime orderDate;
  final num totalPaid;
  final num totalItem;
  final List<OrderedItemModel> orderedItems;
  final num totalKcal;
  final String userId;

  static OrderModel empty() => OrderModel(
    id: '',
    completed: false,
    orderDate: DateTime.now(),
    totalPaid: 0,
    totalItem: 0,
    orderedItems: [],
    totalKcal: 0,
    userId: '',
  );

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
      'orderDate': Timestamp.fromDate(orderDate),
      'totalPaid': totalPaid,
      'totalItem': totalItem,
      'orderedItems': orderedItems.map((item) => item.toJson()).toList(),
      'totalKcal': totalKcal,
      'userId': userId,
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return OrderModel(
        id: document.id,
        completed: data['completed'] ?? false,
        orderDate: (data['orderDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
        totalPaid: data['totalPaid'] ?? 0,
        totalItem: data['totalItem'] ?? 0,
        orderedItems: (data['orderedItems'] as List<dynamic>?)
            ?.map((itemData) => OrderedItemModel.fromMap(itemData as Map<String, dynamic>))
            .toList() ?? [],
        totalKcal: data['totalKcal'] ?? 0,
        userId: data['userId'] ?? '',
      );
    }
    return OrderModel.empty();
  }

  OrderModel copyWith({
    String? id,
    bool? completed,
    DateTime? orderDate,
    num? totalPaid,
    num? totalItem,
    List<OrderedItemModel>? orderedItems,
    num? totalKcal,
    String? userId,
  }) {
    return OrderModel(
      id: id ?? this.id,
      completed: completed ?? this.completed,
      orderDate: orderDate ?? this.orderDate,
      totalPaid: totalPaid ?? this.totalPaid,
      totalItem: totalItem ?? this.totalItem,
      orderedItems: orderedItems ?? this.orderedItems,
      totalKcal: totalKcal ?? this.totalKcal,
      userId: userId ?? this.userId,
    );
  }
}



/// Demo orders______________________________________________________________________________________________________________
final List<OrderModel> testCompletedOrders = <OrderModel>[
  OrderModel(
    id: "#0004982345",
    completed: true,
    orderDate: DateTime.now(),
    totalPaid: 5999,
    totalItem: 6,
    totalKcal: 1800,
    userId: "demouserid123",
    orderedItems: <OrderedItemModel>[
      OrderedItemModel(
        itemId: "00341",
        name: "A",
        itemDetail: "Onk khabar",
        quantity: 2,
        itemPrice: 1998,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 500,
      ),
      OrderedItemModel(
        itemId: "00342",
        name: "B",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 300,
      ),
      OrderedItemModel(
        itemId: "00343",
        name: "C",
        itemDetail: "Onk khabar",
        quantity: 3,
        itemPrice: 2997,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 300,
      ),
    ],
  ),
  OrderModel(
    id: "#0004982346",
    completed: true,
    orderDate: DateTime.now(),
    totalPaid: 8999,
    totalItem: 5,
    totalKcal: 2000,
    userId: "demouserid123",
    orderedItems: <OrderedItemModel>[
      OrderedItemModel(
        itemId: "00344",
        name: "D",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 1999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 500,
      ),
      OrderedItemModel(
        itemId: "00345",
        name: "E",
        itemDetail: "Onk khabar",
        quantity: 2,
        itemPrice: 3998,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 800,
      ),
      OrderedItemModel(
        itemId: "00346",
        name: "F",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 2999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 300,
      ),
      OrderedItemModel(
        itemId: "00347",
        name: "G",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 1999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 400,
      ),
    ],
  ),
];

final List<OrderModel> testPendingOrders = <OrderModel>[
  OrderModel(
    id: "#0004982352",
    completed: false,
    orderDate: DateTime.now(),
    totalPaid: 16999,
    totalItem: 9,
    totalKcal: 3500,
    userId: "demouserid123",
    orderedItems: <OrderedItemModel>[
      OrderedItemModel(
        itemId: "00376",
        name: "H",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 1999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 500,
      ),
      OrderedItemModel(
        itemId: "00377",
        name: "I",
        itemDetail: "Onk khabar",
        quantity: 2,
        itemPrice: 3998,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 700,
      ),
      OrderedItemModel(
        itemId: "00378",
        name: "J",
        itemDetail: "Onk khabar",
        quantity: 3,
        itemPrice: 2997,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 1000,
      ),
      OrderedItemModel(
        itemId: "00379",
        name: "K",
        itemDetail: "Onk khabar",
        quantity: 1,
        itemPrice: 1999,
        imagePath: "assets/default_image/upload_image.png",
        kcal: 800,
      ),
    ],
  ),
];

