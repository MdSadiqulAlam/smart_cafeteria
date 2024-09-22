class CategoryModel {
  final String name;
  final String imagePath;
  final String tag;

  CategoryModel({required this.name, required this.imagePath, required this.tag});
}

List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];

final List<CategoryModel> categoryList = [
  CategoryModel(
    name: 'breakfast',
    imagePath: 'assets/categorical_image/breakfast.png',
    tag: 'breakfast',
  ),
  CategoryModel(
    name: 'beverage',
    imagePath: 'assets/categorical_image/beverage.png',
    tag: 'beverage',
  ),
  CategoryModel(
    name: 'lunch',
    imagePath: 'assets/categorical_image/lunch.png',
    tag: 'lunch',
  ),
  CategoryModel(
    name: 'snacks',
    imagePath: 'assets/categorical_image/snacks.png',
    tag: 'snacks',
  ),
  CategoryModel(
    name: 'iceCream',
    imagePath: 'assets/categorical_image/icecream.png',
    tag: 'ice_cream',
  ),
];
