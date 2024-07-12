class Category {
  final String name;
  final String imagePath;
  final String tag;

  Category(
      {required this.name, required this.imagePath, required this.tag});
}

List<String> cats = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];

final List<Category> categories = [
  Category(
    name: 'breakfast',
    imagePath: 'assets/categorical_image/breakfast.png',
    tag: 'breakfast',
  ),
  Category(
      name: 'beverage',
      imagePath: 'assets/categorical_image/beverage.png',
      tag: 'beverage'),
  Category(
    name: 'lunch',
    imagePath: 'assets/categorical_image/lunch.png',
    tag: 'lunch',
  ),
  Category(
    name: 'snacks',
    imagePath: 'assets/categorical_image/snacks.png',
    tag: 'snacks',
  ),
  Category(
    name: 'iceCream',
    imagePath: 'assets/categorical_image/icecream.png',
    tag: 'ice_cream',
  ),
];
