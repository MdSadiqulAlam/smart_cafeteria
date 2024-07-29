import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/item_model.dart';

import 'favorite_card.dart';

class FavoriteGridview extends StatefulWidget {
  const FavoriteGridview({super.key});

  @override
  State<FavoriteGridview> createState() => _FavoriteGridviewState();
}

class _FavoriteGridviewState extends State<FavoriteGridview> {
  final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: allItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // maxCrossAxisExtent: 180,
        mainAxisExtent: 103,
        // childAspectRatio: 0.95,
        mainAxisSpacing: 10,
        // crossAxisSpacing: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        final ItemModel item_ = allItems[index % allItems.length];
        return FavoriteCard(item_: item_);
      },
    );
  }
}
