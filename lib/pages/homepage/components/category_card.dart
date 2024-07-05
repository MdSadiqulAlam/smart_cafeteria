import 'package:flutter/material.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(" ${category_.name} Category "),
                duration: const Duration(milliseconds: 700),
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
                category_.name,
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
