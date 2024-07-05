class MyItemInfo {
  final String name;
  final String kcal;
  final String price;
  final String imagePath;
  final int itemSold;
  final String description;
  final String itemDetail;
  final double ratingCount;
  final Map<double, double> ratingMap;

  MyItemInfo({
    required this.name,
    required this.kcal,
    required this.price,
    required this.imagePath,
    required this.itemSold,
    required this.description,
    required this.itemDetail,
    required this.ratingCount,
    required this.ratingMap,
  });
}

final List<MyItemInfo> allItems = [
  MyItemInfo(
    name: "khichuri",
    kcal: "200",
    price: "55",
    imagePath: 'assets/test_image/carousel/khichuri1.png',
    itemSold: 150,
    description:
        "A hearty dish featuring aromatic khichuri, a flavorful blend of lentils and rice, served with tender chicken curry. Enjoy the comforting textures and savory spices, perfect for a fulfilling meal.",
    itemDetail: "Khichuri,Chicken Curry,Salad",
    ratingCount: 12934,
    ratingMap: {5: 9000, 4: 2000, 3: 1000, 2: 34, 1: 900},
  ),
  MyItemInfo(
    name: "sandwich",
    kcal: "1100",
    price: "40",
    imagePath: 'assets/test_image/carousel/sandwich1.png',
    itemSold: 10,
    description:
        "A delicious blend of fresh ingredients between toasted bread slices, featuring crisp lettuce, juicy tomatoes, creamy cheese, and your choice of meats or veggies. Customize with spreads and condiments for a satisfying, quick meal.",
    itemDetail: "Chicken,Egg,WhiteSauce,Bread",
    ratingCount: 13231,
    ratingMap: {5: 2231, 4: 2000, 3: 4000, 2: 4000, 1: 1000},
  ),
  MyItemInfo(
    name: "sub sandwich",
    kcal: "500",
    price: "80",
    imagePath: 'assets/test_image/carousel/sub1.png',
    itemSold: 990,
    description:
        "A savory combination of fresh ingredients on toasted bread, including crisp lettuce, juicy tomatoes, creamy cheese, and your choice of meats or vegetables. Customizable with a variety of spreads and condiments, perfect for a quick and satisfying meal.",
    itemDetail: "Vegetable,Chicken,Egg,WhiteSauce,Bread",
    ratingCount: 22857,
    ratingMap: {5: 17000, 4: 2000, 3: 3000, 2: 800, 1: 57},
  ),
];
