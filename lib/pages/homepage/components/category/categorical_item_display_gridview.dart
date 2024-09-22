import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/category/categorical_item_display_controller.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_card.dart';


class CategoricalItemDisplayGridview extends StatelessWidget {
  final String categoryTag; // Add this to pass the tag

  const CategoricalItemDisplayGridview({super.key, required this.categoryTag});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller with the tag
    final controller = Get.put(CategoricalItemDisplayController(tag: categoryTag));

    /// Create a filtered list based on the filter criteria
    /// final List<ItemModel> filteredItems =
    /// filter ? testAllItems.where((item) => item.category.contains(filterCategory)).toList() : testAllItems;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.categoryItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getScreenWidth(context) < 400 ? 2 : 5,

          /// maxCrossAxisExtent: 180,
          mainAxisExtent: 195,

          /// childAspectRatio: 0.95,
          mainAxisSpacing: 8,
          crossAxisSpacing: 7,
        ),
        itemBuilder: (BuildContext context, int index) {
          ItemModel item = controller.categoryItems[index];
          return ItemCardGridView(item_: item);
        },
      );
    });
  }
}
