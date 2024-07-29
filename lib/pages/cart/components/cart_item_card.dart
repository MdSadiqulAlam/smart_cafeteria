import 'dart:math';

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';

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
                    Get.to(()=>ItemDetail(item_: item_));
                  },
                  child: AspectRatio(
                    aspectRatio: 0.97,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(1.5)),
                      child: Image.asset(item_.imagePath, fit: BoxFit.cover),
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
                      style: getTextTheme(context).headlineSmall?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
            height: 25,
            width: 25,
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("clicked"), duration: Duration(milliseconds: 700)));
              },
              padding: const EdgeInsets.all(0),
              // icon: const Icon(Icons.delete_outline_rounded),
              icon: const Icon(Icons.close),
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class CartItemQuantity extends StatefulWidget {
  const CartItemQuantity({super.key, required this.item_});

  final ItemModel item_;

  @override
  State<CartItemQuantity> createState() => _CartItemQuantityState();
}

class _CartItemQuantityState extends State<CartItemQuantity> {
  int quantity = 1;

  void _setQuantity(int val) {
    setState(() {
      quantity += val;
      quantity = max(quantity, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ItemModel item_ = widget.item_;
    const double textSize_ = 16.5;
    const double iconSize_ = 20;
    const double iconBorderSize_ = iconSize_ + 5;

    return Stack(
      children: [
        Column(
          children: [
            /// price
            Row(
              children: [
                Text(
                  "Tk. ${int.parse(item_.price) * quantity}",
                  style: getTextTheme(context).labelMedium?.copyWith(
                        // color: Theme.of(context).colorScheme.onSecondaryContainer,
                        color: getColorScheme(context).error,
                        fontSize: textSize_ + 2.8,
                      ),
                ),
                const SizedBox(width: 15),
                Text(
                  "${item_.price} x1",
                  style: getTextTheme(context)
                      .labelLarge
                      ?.copyWith(color: getColorScheme(context).onSurfaceVariant, fontSize: textSize_ - 3),
                ),
              ],
            ),

            /// cal info
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_outlined,
                  color: getColorScheme(context).onSecondaryContainer,
                  size: textSize_ + 2,
                ),
                Text(
                  "${int.parse(item_.kcal) * quantity} cal",
                  style: getTextTheme(context).labelLarge?.copyWith(
                        color: getColorScheme(context).onSecondaryContainer,
                        fontSize: textSize_,
                      ),
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
                      _setQuantity(-1);
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
                      _setQuantity(1);
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
