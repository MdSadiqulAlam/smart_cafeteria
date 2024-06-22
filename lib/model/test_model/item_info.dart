class MyItemInfo {
  final String name;
  final String kcal;
  final String price;
  final String imagePath;

  MyItemInfo({
    required this.name,
    required this.kcal,
    required this.price,
    required this.imagePath,
  });
}

final List<MyItemInfo> allItems = [
  MyItemInfo(
    name: "khichuri",
    kcal: "200",
    price: "55",
    imagePath: 'assets/test_image/test.png',
  ),
  MyItemInfo(
    name: "italian dish",
    kcal: "1100",
    price: "550",
    imagePath: 'assets/test_image/test1.png',
  ),
  MyItemInfo(
    name: "burger",
    kcal: "500",
    price: "200",
    imagePath: 'assets/test_image/test2.png',
  )
];
