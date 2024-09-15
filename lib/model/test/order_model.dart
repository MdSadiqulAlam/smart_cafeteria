class OrderedItemModel {
  const OrderedItemModel({
    required this.productID,
    required this.quantity,
    required this.itemTotalPrice,
    required this.weight,
    required this.itemIndex,
  });

  final String productID;
  final String quantity;
  final String itemTotalPrice;
  final String weight;

  // todo: without backend
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
      OrderedItemModel(
        productID: "00341",
        quantity: "2",
        itemTotalPrice: "1998",
        weight: "350g",
        itemIndex: 13,
      ),
      OrderedItemModel(
        productID: "00342",
        quantity: "1",
        itemTotalPrice: "999",
        weight: "400g",
        itemIndex: 18,
      ),
      OrderedItemModel(
        productID: "00343",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "450g",
        itemIndex: 15,
      ),
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
      OrderedItemModel(
        productID: "00344",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 7,
      ),
      OrderedItemModel(
        productID: "00345",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "250g",
        itemIndex: 16,
      ),
      OrderedItemModel(
        productID: "00346",
        quantity: "1",
        itemTotalPrice: "2999",
        weight: "500g",
        itemIndex: 4,
      ),
      OrderedItemModel(
        productID: "00347",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 20,
      ),
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
      OrderedItemModel(
        productID: "00348",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "350g",
        itemIndex: 25,
      ),
      OrderedItemModel(
        productID: "00349",
        quantity: "2",
        itemTotalPrice: "1998",
        weight: "400g",
        itemIndex: 7,
      ),
      OrderedItemModel(
        productID: "00350",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 18,
      ),
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
      OrderedItemModel(
        productID: "00351",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 13,
      ),
      OrderedItemModel(
        productID: "00352",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 12,
      ),
      OrderedItemModel(
        productID: "00353",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "400g",
        itemIndex: 6,
      ),
      OrderedItemModel(
        productID: "00354",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 8,
      ),
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
      OrderedItemModel(
        productID: "00355",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 11,
      ),
      OrderedItemModel(
        productID: "00356",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 6,
      ),
      OrderedItemModel(
        productID: "00357",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 5,
      ),
      OrderedItemModel(
        productID: "00358",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 10,
      ),
      OrderedItemModel(
        productID: "00359",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 13,
      ),
      OrderedItemModel(
        productID: "00360",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 18,
      ),
      OrderedItemModel(
        productID: "00361",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 11,
      ),
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
      OrderedItemModel(
        productID: "00362",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00363",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 4,
      ),
      OrderedItemModel(
        productID: "00364",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 11,
      ),
      OrderedItemModel(
        productID: "00365",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 7,
      ),
      OrderedItemModel(
        productID: "00366",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00367",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 0,
      ),
      OrderedItemModel(
        productID: "00368",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 3,
      ),
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
      OrderedItemModel(
        productID: "00369",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 9,
      ),
      OrderedItemModel(
        productID: "00370",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 13,
      ),
      OrderedItemModel(
        productID: "00371",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 24,
      ),
      OrderedItemModel(
        productID: "00372",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 2,
      ),
      OrderedItemModel(
        productID: "00373",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 10,
      ),
      OrderedItemModel(
        productID: "00374",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 21,
      ),
      OrderedItemModel(
        productID: "00375",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 19,
      ),
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
      OrderedItemModel(
        productID: "00376",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00377",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 7,
      ),
      OrderedItemModel(
        productID: "00378",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 8,
      ),
      OrderedItemModel(
        productID: "00379",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 15,
      ),
      OrderedItemModel(
        productID: "00380",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00381",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 2,
      ),
      OrderedItemModel(
        productID: "00382",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 21,
      ),
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
      OrderedItemModel(
        productID: "00383",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 17,
      ),
      OrderedItemModel(
        productID: "00384",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 11,
      ),
      OrderedItemModel(
        productID: "00385",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 23,
      ),
      OrderedItemModel(
        productID: "00386",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 24,
      ),
      OrderedItemModel(
        productID: "00387",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 5,
      ),
      OrderedItemModel(
        productID: "00388",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 4,
      ),
      OrderedItemModel(
        productID: "00389",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 1,
      ),
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
      OrderedItemModel(
        productID: "00376",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "300g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00377",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 7,
      ),
      OrderedItemModel(
        productID: "00378",
        quantity: "3",
        itemTotalPrice: "2997",
        weight: "400g",
        itemIndex: 8,
      ),
      OrderedItemModel(
        productID: "00379",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 15,
      ),
      OrderedItemModel(
        productID: "00380",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 22,
      ),
      OrderedItemModel(
        productID: "00381",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "250g",
        itemIndex: 2,
      ),
      OrderedItemModel(
        productID: "00382",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "350g",
        itemIndex: 21,
      ),
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
      OrderedItemModel(
        productID: "00351",
        quantity: "2",
        itemTotalPrice: "3998",
        weight: "350g",
        itemIndex: 13,
      ),
      OrderedItemModel(
        productID: "00352",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "450g",
        itemIndex: 12,
      ),
      OrderedItemModel(
        productID: "00353",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "400g",
        itemIndex: 6,
      ),
      OrderedItemModel(
        productID: "00354",
        quantity: "1",
        itemTotalPrice: "1999",
        weight: "500g",
        itemIndex: 8,
      ),
    ],
  ),
];