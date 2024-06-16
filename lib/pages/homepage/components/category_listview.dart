import 'package:flutter/material.dart';
import '../../../model/category_model.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
    required this.card_height,
  });

  final double card_height;
  final List<Category> categories = [
    Category(
        name: 'Breakfast', imagePath: 'assets/categorical_image/breakfast.png'),
    Category(
        name: 'Beverage', imagePath: 'assets/categorical_image/beverage.png'),
    Category(name: 'Lunch', imagePath: 'assets/categorical_image/lunch.png'),
    Category(name: 'Snacks', imagePath: 'assets/categorical_image/snacks.png'),
    Category(
        name: 'IceCream', imagePath: 'assets/categorical_image/icecream.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: card_height,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 3.5,);
        },
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
              card_height: card_height, category_: categories[index]);
        }
      ),
    );
  }
}
