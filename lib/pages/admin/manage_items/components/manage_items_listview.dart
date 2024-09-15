import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_card.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_controller.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/test/item_model.dart';

class ManageItemsListview extends StatelessWidget {
  const ManageItemsListview({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   ManageItemsController.instance.filterItems();
  //   // print(ManageItemsController.instance.filteredItems);
  //   return GridView.builder(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     physics: const BouncingScrollPhysics(),
  //     // shrinkWrap: true,
  //     itemCount: ManageItemsController.instance.filteredItems.length,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: getScreenWidth(context) < 400 ? 2 : 5,
  //       // maxCrossAxisExtent: 180,
  //       mainAxisExtent: 195,
  //       // childAspectRatio: 0.95,
  //       mainAxisSpacing: 8,
  //       crossAxisSpacing: 7,
  //     ),
  //     itemBuilder: (BuildContext context, int index) {
  //       ItemModel item_ = ManageItemsController.instance.filteredItems[index];
  //       // return ItemCardGridView(item_: item_);
  //       return Container(child: Center(child: Text(item_.name),),);
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filteredItems = ManageItemsController.instance.filteredItems;

      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const ClampingScrollPhysics(),
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
          ItemModel item_ = filteredItems[index];
          return ManageItemsCardAdmin(item_: item_);
        },
      );
    });
  }
}
