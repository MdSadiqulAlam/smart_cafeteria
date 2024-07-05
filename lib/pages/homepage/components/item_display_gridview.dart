import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/test_model/item_info.dart';
import 'item_display_card.dart';

class ItemDisplayGridView extends StatelessWidget {
  const ItemDisplayGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allItems.length * 5,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 2,
        maxCrossAxisExtent: 180,
        mainAxisExtent: 212,
        // childAspectRatio: 0.95,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ItemCardGridView(item_: allItems[index % allItems.length]);
      },
    );
  }
}
