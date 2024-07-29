import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import '../../../model/category_model.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final double cardHeight = getAppBarHeight() * 1.52;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10 - 2),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        // separatorBuilder: (_, __) => const SizedBox(width: 0),
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(cardHeight: cardHeight, category_: categories[index]);
        },
      ),
    );
  }
}
