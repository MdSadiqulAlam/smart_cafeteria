import 'package:flutter/material.dart';
import '../../../model/category_model.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.cardHeight,
  });

  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 3.5,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              card_height: cardHeight,
              category_: categories[index],
            );
          }),
    );
  }
}
