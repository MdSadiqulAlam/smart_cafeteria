class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

final List<Category> categories = [
  Category(
    name: 'Breakfast',
    imagePath: 'assets/categorical_image/breakfast.png',
  ),
  Category(
    name: 'Beverage',
    imagePath: 'assets/categorical_image/beverage.png',
  ),
  Category(
    name: 'Lunch',
    imagePath: 'assets/categorical_image/lunch.png',
  ),
  Category(
    name: 'Snacks',
    imagePath: 'assets/categorical_image/snacks.png',
  ),
  Category(
    name: 'IceCream',
    imagePath: 'assets/categorical_image/icecream.png',
  ),
];
