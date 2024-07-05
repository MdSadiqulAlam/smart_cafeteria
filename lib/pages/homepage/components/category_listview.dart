import 'package:flutter/material.dart';
import '../../../model/category_model.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 1.65;

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
            width: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            cardHeight: cardHeight,
            category_: categories[index],
          );
        },
      ),
    );
  }
}
