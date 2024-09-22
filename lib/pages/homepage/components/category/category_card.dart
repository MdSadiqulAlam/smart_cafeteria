import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/homepage/components/category/categorical_item_display.dart';

import '../../../../model/test/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.cardHeight, required this.category_});

  final double cardHeight;
  final CategoryModel category_;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardHeight * 0.92,
      height: cardHeight * 1,
      child: Card.filled(
        child: InkWell(
          onTap: () {
            Get.to(()=>CategoricalItemDisplay(name: category_.name, tag: category_.tag));
          },
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 4, 6, 1),
                child: Container(
                  width: cardHeight * 0.65,
                  height: cardHeight * 0.6,
                  decoration:
                      BoxDecoration(color: getColorScheme(context).tertiaryContainer, borderRadius: BorderRadius.circular(100)),
                  child: Image(image: AssetImage(category_.imagePath), fit: BoxFit.cover),
                ),
              ),
              Text(
                category_.name.toCapitalCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: getColorScheme(context).onSecondaryContainer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
