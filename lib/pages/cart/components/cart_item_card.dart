import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';

import '../../../model/item_model.dart';
import '../../item_detail/item_detail.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    final bool brightness = getBrightness(context);
    final double cardHeight = getAppBarHeight() * 1.88;

    return Stack(
      children: [
        Container(
          height: cardHeight,
          decoration: BoxDecoration(
            // border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,width: 2),
            borderRadius: BorderRadius.circular(10),
            color: brightness
                ? getColorScheme(context).primaryFixed.withOpacity(0.8)
                : getColorScheme(context).onPrimaryFixedVariant.withOpacity(0.8),
            // color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// image
              Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ItemDetail(item_: item_));
                  },
                  child: AspectRatio(
                    aspectRatio: 0.97,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(1.5)),
                      child: CachedNetworkImage(
                        imageUrl: item_.imagePath,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: LoadingAnimationWidget.stretchedDots(color: getColorScheme(context).onSurface, size: 30),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              /// Info
              const SizedBox(width: 3),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item_.name.toCapitalCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                      style: getTextTheme(context).titleSmall?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      width: getScreenWidth(context) * 0.65,
                      child: Text(
                        item_.itemDetail,
                        style: getTextTheme(context).labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontSize: 13,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Divider(height: 5),
                    CartItemQuantity(item_: item_),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 2,
          top: 2,
          child: SizedBox(
            height: 30,
            width: 30,
            child: IconButton(
              onPressed: () => ItemDisplayController.instance.removeItemFromCart(item_.id),
              padding: const EdgeInsets.all(0),
              // icon: const Icon(Icons.delete_outline_rounded),
              icon: const Icon(Icons.close),
              iconSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}

class CartItemQuantity extends StatelessWidget {
  const CartItemQuantity({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    final itemDisplayController = ItemDisplayController.instance;
    // final cartController = CartController.instance;

    int quantity = itemDisplayController.getItemQuantity(item_.id);

    /// size variables
    const double textSize_ = 16.5;
    const double iconSize_ = 22;
    const double iconBorderSize_ = iconSize_ + 5;

    return Stack(
      children: [
        Column(
          children: [
            /// price
            Row(
              children: [
                Text(
                  "Tk. ${item_.price * quantity}",
                  style: getTextTheme(context)
                      .labelMedium
                      ?.copyWith(color: getColorScheme(context).error, fontSize: textSize_ + 2.8),
                ),
                const SizedBox(width: 15),
                Text(
                  "${item_.price} x1",
                  style: getTextTheme(context)
                      .labelLarge
                      ?.copyWith(color: getColorScheme(context).onSurfaceVariant, fontSize: textSize_ - 1),
                ),
              ],
            ),

            /// cal info
            Row(
              children: [
                Icon(Icons.local_fire_department_outlined,
                    color: getColorScheme(context).onSecondaryContainer, size: textSize_ + 2),
                Text(
                  "${item_.kcal * quantity} cal",
                  style: getTextTheme(context)
                      .labelLarge
                      ?.copyWith(color: getColorScheme(context).onSecondaryContainer, fontSize: textSize_),
                ),
              ],
            ),
          ],
        ),

        /// quantity buttons
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 5),
            child: Row(
              children: [
                SizedBox(
                  height: iconBorderSize_,
                  width: iconBorderSize_,
                  child: IconButton.filledTonal(
                    onPressed: () {
                      // _setQuantity(-1);
                      if (quantity > 1) {
                        itemDisplayController.updateItemQuantity(item_.id, quantity - 1);
                      } else {
                        itemDisplayController.removeItemFromCart(item_.id);
                      }
                    },
                    padding: const EdgeInsets.all(0),
                    style: IconButton.styleFrom(backgroundColor: getColorScheme(context).tertiaryContainer),
                    icon: Icon(Icons.remove_sharp, color: getColorScheme(context).onTertiaryContainer),
                    iconSize: iconSize_,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    "$quantity",
                    style: getTextTheme(context).labelLarge?.copyWith(
                          color: getColorScheme(context).onSecondaryContainer,
                          fontSize: textSize_,
                        ),
                  ),
                ),
                SizedBox(
                  height: iconBorderSize_,
                  width: iconBorderSize_,
                  child: IconButton.filledTonal(
                    onPressed: () {
                      // _setQuantity(1);
                      itemDisplayController.updateItemQuantity(item_.id, quantity + 1);
                    },
                    padding: const EdgeInsets.all(0),
                    style: IconButton.styleFrom(backgroundColor: getColorScheme(context).tertiaryContainer),
                    icon: Icon(Icons.add_sharp, color: getColorScheme(context).onTertiaryContainer),
                    iconSize: iconSize_,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
