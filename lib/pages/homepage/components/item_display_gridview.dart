import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/test_model/item_info.dart';
import 'item_display_card.dart';

class ItemDisplayGridView extends StatelessWidget {
  const ItemDisplayGridView({
    super.key,
    this.filter = false,
    this.filterCategory = "",
  });

  final bool filter;
  final String filterCategory;

  @override
  Widget build(BuildContext context) {
    // Create a filtered list based on the filter criteria
    final List<MyItemInfo> filteredItems = filter
        ? allItems
            .where((item) => item.category.contains(filterCategory))
            .toList()
        : allItems;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredItems.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 2,
        maxCrossAxisExtent: 180,
        mainAxisExtent: 212,
        // childAspectRatio: 0.95,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        MyItemInfo item_ = filteredItems[index % allItems.length];
        return ItemCardGridView(item_: item_);
      },
    );
  }
}
