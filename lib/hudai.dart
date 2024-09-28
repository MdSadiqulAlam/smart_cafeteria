class OrderedItemModel {
  const OrderedItemModel({
    required this.itemId,
    required this.quantity,
    required this.itemPrice,
    required this.itemIndex,
  });

  final String itemId;
  // final String name;//
  // final String itemDetail;//
  final String quantity;
  final String itemPrice;
  // final String imagePath;//

  // todo: without backend. Will remove while implementing backend
  final int itemIndex;
}

class OrderModel {
  OrderModel({
    required this.orderID,
    required this.completed,
    required this.date,
    required this.time,
    required this.totalPaid,
    required this.totalItem,
    required this.orderedItems,
  });

  final String orderID;
  final bool completed;
  final String date;
  final String time;
  final String totalPaid;
  final String totalItem;
  final List<OrderedItemModel> orderedItems;
}

final List<OrderModel> completedOrders = <OrderModel>[
  OrderModel(
    orderID: "#0004982345",
    completed: true,
    date: "July 10, 2024",
    time: "13:38:13",
    totalPaid: "5999",
    totalItem: '6',
    orderedItems: <OrderedItemModel>[
      OrderedItemModel(itemId: "00341", quantity: "2", itemPrice: "1998", itemIndex: 13),
      OrderedItemModel(itemId: "00342", quantity: "1", itemPrice: "999", itemIndex: 18),
      OrderedItemModel(itemId: "00343", quantity: "3", itemPrice: "2997", itemIndex: 15),
    ],
  ),
  OrderModel(
    orderID: "#0004982346",
    completed: true,
    date: "July 10, 2024",
    time: "14:30:45",
    totalPaid: "8999",
    totalItem: '5',
    orderedItems: [
      OrderedItemModel(itemId: "00344", quantity: "1", itemPrice: "1999", itemIndex: 7),
      OrderedItemModel(itemId: "00345", quantity: "2", itemPrice: "3998", itemIndex: 16),
      OrderedItemModel(itemId: "00346", quantity: "1", itemPrice: "2999", itemIndex: 4),
      OrderedItemModel(itemId: "00347", quantity: "1", itemPrice: "1999", itemIndex: 20),
    ],
  ),
  OrderModel(
    orderID: "#0004982347",
    completed: true,
    date: "July 10, 2024",
    time: "15:22:10",
    totalPaid: "6999",
    totalItem: '6',
    orderedItems: [
      OrderedItemModel(itemId: "00348", quantity: "3", itemPrice: "2997", itemIndex: 25),
      OrderedItemModel(itemId: "00349", quantity: "2", itemPrice: "1998", itemIndex: 7),
      OrderedItemModel(itemId: "00350", quantity: "1", itemPrice: "1999", itemIndex: 18),
    ],
  ),
  OrderModel(
    orderID: "#0004982348",
    completed: true,
    date: "July 10, 2024",
    time: "16:05:30",
    totalPaid: "7999",
    totalItem: '6',
    orderedItems: [
      OrderedItemModel(itemId: "00351", quantity: "2", itemPrice: "3998", itemIndex: 13),
      OrderedItemModel(itemId: "00352", quantity: "1", itemPrice: "1999", itemIndex: 12),
      OrderedItemModel(itemId: "00353", quantity: "1", itemPrice: "1999", itemIndex: 6),
      OrderedItemModel(itemId: "00354", quantity: "1", itemPrice: "1999", itemIndex: 8),
    ],
  ),
  OrderModel(
    orderID: "#0004982349",
    completed: true,
    date: "July 10, 2024",
    time: "17:15:00",
    totalPaid: "10999",
    totalItem: '8',
    orderedItems: [
      OrderedItemModel(itemId: "00355", quantity: "1", itemPrice: "1999", itemIndex: 11),
      OrderedItemModel(itemId: "00356", quantity: "2", itemPrice: "3998", itemIndex: 6),
      OrderedItemModel(itemId: "00357", quantity: "3", itemPrice: "2997", itemIndex: 5),
      OrderedItemModel(itemId: "00358", quantity: "1", itemPrice: "1999", itemIndex: 10),
      OrderedItemModel(itemId: "00359", quantity: "1", itemPrice: "1999", itemIndex: 13),
      OrderedItemModel(itemId: "00360", quantity: "1", itemPrice: "1999", itemIndex: 18),
      OrderedItemModel(itemId: "00361", quantity: "1", itemPrice: "1999", itemIndex: 11),
    ],
  ),
  OrderModel(
    orderID: "#0004982350",
    completed: true,
    date: "July 10, 2024",
    time: "18:25:15",
    totalPaid: "12999",
    totalItem: '10',
    orderedItems: [
      OrderedItemModel(itemId: "00362", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00363", quantity: "2", itemPrice: "3998", itemIndex: 4),
      OrderedItemModel(itemId: "00364", quantity: "3", itemPrice: "2997", itemIndex: 11),
      OrderedItemModel(itemId: "00365", quantity: "1", itemPrice: "1999", itemIndex: 7),
      OrderedItemModel(itemId: "00366", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00367", quantity: "1", itemPrice: "1999", itemIndex: 0),
      OrderedItemModel(itemId: "00368", quantity: "1", itemPrice: "1999", itemIndex: 3),
    ],
  ),
  OrderModel(
    orderID: "#0004982351",
    completed: true,
    date: "July 10, 2024",
    time: "19:30:40",
    totalPaid: "14999",
    totalItem: '12',
    orderedItems: [
      OrderedItemModel(itemId: "00369", quantity: "1", itemPrice: "1999", itemIndex: 9),
      OrderedItemModel(itemId: "00370", quantity: "2", itemPrice: "3998", itemIndex: 13),
      OrderedItemModel(itemId: "00371", quantity: "3", itemPrice: "2997", itemIndex: 24),
      OrderedItemModel(itemId: "00372", quantity: "1", itemPrice: "1999", itemIndex: 2),
      OrderedItemModel(itemId: "00373", quantity: "1", itemPrice: "1999", itemIndex: 10),
      OrderedItemModel(itemId: "00374", quantity: "1", itemPrice: "1999", itemIndex: 21),
      OrderedItemModel(itemId: "00375", quantity: "1", itemPrice: "1999", itemIndex: 19),
    ],
  ),
  OrderModel(
    orderID: "#0004982352",
    completed: true,
    date: "July 10, 2024",
    time: "20:45:55",
    totalPaid: "16999",
    totalItem: '9',
    orderedItems: [
      OrderedItemModel(itemId: "00376", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00377", quantity: "2", itemPrice: "3998", itemIndex: 7),
      OrderedItemModel(itemId: "00378", quantity: "3", itemPrice: "2997", itemIndex: 8),
      OrderedItemModel(itemId: "00379", quantity: "1", itemPrice: "1999", itemIndex: 15),
      OrderedItemModel(itemId: "00380", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00381", quantity: "1", itemPrice: "1999", itemIndex: 2),
      OrderedItemModel(itemId: "00382", quantity: "1", itemPrice: "1999", itemIndex: 21),
    ],
  ),
  OrderModel(
    orderID: "#0004982353",
    completed: true,
    date: "July 10, 2024",
    time: "21:55:30",
    totalPaid: "18999",
    totalItem: '16',
    orderedItems: [
      OrderedItemModel(itemId: "00383", quantity: "1", itemPrice: "1999", itemIndex: 17),
      OrderedItemModel(itemId: "00384", quantity: "2", itemPrice: "3998", itemIndex: 11),
      OrderedItemModel(itemId: "00385", quantity: "3", itemPrice: "2997", itemIndex: 23),
      OrderedItemModel(itemId: "00386", quantity: "1", itemPrice: "1999", itemIndex: 24),
      OrderedItemModel(itemId: "00387", quantity: "1", itemPrice: "1999", itemIndex: 5),
      OrderedItemModel(itemId: "00388", quantity: "1", itemPrice: "1999", itemIndex: 4),
      OrderedItemModel(itemId: "00389", quantity: "1", itemPrice: "1999", itemIndex: 1),
    ],
  ),
];

final List<OrderModel> pendingOrders = <OrderModel>[
  OrderModel(
    orderID: "#0004982352",
    completed: false,
    date: "July 10, 2024",
    time: "20:45:55",
    totalPaid: "16999",
    totalItem: '9',
    orderedItems: [
      OrderedItemModel(itemId: "00376", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00377", quantity: "2", itemPrice: "3998", itemIndex: 7),
      OrderedItemModel(itemId: "00378", quantity: "3", itemPrice: "2997", itemIndex: 8),
      OrderedItemModel(itemId: "00379", quantity: "1", itemPrice: "1999", itemIndex: 15),
      OrderedItemModel(itemId: "00380", quantity: "1", itemPrice: "1999", itemIndex: 22),
      OrderedItemModel(itemId: "00381", quantity: "1", itemPrice: "1999", itemIndex: 2),
      OrderedItemModel(itemId: "00382", quantity: "1", itemPrice: "1999", itemIndex: 21),
    ],
  ),
  OrderModel(
    orderID: "#0004982348",
    completed: false,
    date: "July 10, 2024",
    time: "16:05:30",
    totalPaid: "7999",
    totalItem: '12',
    orderedItems: [
      OrderedItemModel(itemId: "00351", quantity: "2", itemPrice: "3998", itemIndex: 13),
      OrderedItemModel(itemId: "00352", quantity: "1", itemPrice: "1999", itemIndex: 12),
      OrderedItemModel(itemId: "00353", quantity: "1", itemPrice: "1999", itemIndex: 6),
      OrderedItemModel(itemId: "00354", quantity: "1", itemPrice: "1999", itemIndex: 8),
    ],
  ),
];
