import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/favorites/components/favorite_controller.dart';

import '../../../config/get_config.dart';
import 'favorite_card.dart';

class FavoriteGridview extends StatelessWidget {
  const FavoriteGridview({super.key});

  // final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 1;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(FavoriteController());

    return Obx(() {
      if (favoriteController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: getColorScheme(context).primary),
        );
      }

      final favoriteItems = favoriteController.favoriteItems;

      return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: favoriteItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          // maxCrossAxisExtent: 180,
          mainAxisExtent: 105,
          // childAspectRatio: 0.95,
          mainAxisSpacing: 10,
          // crossAxisSpacing: 7,
        ),
        itemBuilder: (BuildContext context, int index) {
          final ItemModel item_ = favoriteItems[index % testAllItems.length];
          return FavoriteCard(item_: item_);
        },
      );
      ;
    });
  }
}
