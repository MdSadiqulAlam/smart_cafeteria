import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/homepage/components/categorical_item_display.dart';
import '../../../model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.cardHeight,
    required this.category_,
  });

  final double cardHeight;
  final Category category_;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardHeight * 0.9,
      height: cardHeight * 1,
      child: Card.filled(
        // color: Theme.of(context).colorScheme.secondaryFixed,
        child: InkWell(
          onTap: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(" ${category_.name} Category "),
            //     duration: const Duration(milliseconds: 700),
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoricalItemDisplay(
                    name: category_.name, tag: category_.tag),
              ),
            );
          },
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 4, 6, 1),
                child: Container(
                  width: cardHeight * 0.6,
                  height: cardHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(category_.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                category_.name.toCapitalCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  // fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
