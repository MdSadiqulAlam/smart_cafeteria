import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/search_item/search_item_controller.dart';

import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_card.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchItemController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // titleSpacing: 0,
        title: TextFormField(
          controller: controller.searchController,
          autofocus: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search_rounded),
            hintText: 'Search item...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 2),
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          if (controller.isLoading.value) {
            // Display a loading indicator when search is in progress
            return const Center(child: CircularProgressIndicator());
          }

          /// filtered items
          final filteredItems = controller.filteredItems;
          if (filteredItems.isEmpty) {
            return const Center(child: Text("No items found."));
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getScreenWidth(context) < 400 ? 2 : 5,

              /// maxCrossAxisExtent: 180,
              mainAxisExtent: 195,

              /// childAspectRatio: 0.95,
              mainAxisSpacing: 8,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (BuildContext context, int index) {
              ItemModel item = filteredItems[index];
              return ItemCardGridView(item_: item);
            },
          );
        }),
      ),
    );
  }
}
