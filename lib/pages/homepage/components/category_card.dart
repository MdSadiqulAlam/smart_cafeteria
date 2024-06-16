import 'package:flutter/material.dart';
import '../../../model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.card_height,
    required this.category_,
  });

  final double card_height;
  final Category category_;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: card_height * 0.9,
      height: card_height * 1,
      child: Card.filled(
        child: InkWell(
          onTap: () {Placeholder();},
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 1.5),
                child: Container(
                  width: card_height * 0.6,
                  height: card_height * 0.6,
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
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
