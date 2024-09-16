import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';

import 'item_display_card.dart';

class ItemDisplayGridView extends StatelessWidget {
  const ItemDisplayGridView({super.key, this.filter = false, this.filterCategory = ""});

  final bool filter;
  final String filterCategory;

  @override
  Widget build(BuildContext context) {
    // Create a filtered list based on the filter criteria
    final List<ItemModel> filteredItems =
        filter ? testAllItems.where((item) => item.category.contains(filterCategory)).toList() : testAllItems;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getScreenWidth(context) < 400 ? 2 : 5,
        // maxCrossAxisExtent: 180,
        mainAxisExtent: 195,
        // childAspectRatio: 0.95,
        mainAxisSpacing: 8,
        crossAxisSpacing: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        ItemModel item_ = filteredItems[index % testAllItems.length];
        return ItemCardGridView(item_: item_);
      },
    );
  }
}
