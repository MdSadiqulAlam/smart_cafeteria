import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/item_detail/item_detail.dart';

import 'favorite_controller.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    Color subInfoColor = getColorScheme(context).onSurfaceVariant.withOpacity(0.8);

    return InkWell(
      onTap: () => Get.to(() => ItemDetail(item_: item_)),
      borderRadius: BorderRadius.circular(7),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: getColorScheme(context).outline.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(7),
          color: getColorScheme(context).secondaryContainer,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(7), right: Radius.circular(1)),
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
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// name
                    Text(
                      item_.name.toCapitalCase(),
                      // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                      style: getTextTheme(context).headlineSmall?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    /// item details
                    SizedBox(
                      width: getScreenWidth(context) * 0.55,
                      child: Text(
                        item_.itemDetail,
                        style: getTextTheme(context).labelMedium?.copyWith(color: subInfoColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    /// price , calorie , sold
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          "TK. ${item_.price}",
                          style: getTextTheme(context).titleLarge?.copyWith(
                                color: getColorScheme(context).onSecondaryContainer,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          "    |   ",
                          style: getTextTheme(context).labelLarge?.copyWith(color: subInfoColor),
                        ),
                        Icon(Icons.local_fire_department_outlined, color: subInfoColor, size: 16),
                        Text(
                          "${item_.kcal}    |    sold:${item_.itemSold}",
                          style: getTextTheme(context).labelLarge?.copyWith(color: subInfoColor, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    /// add to cart button
                    const AddToCartFavourite(),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),

            /// favorite button
            Positioned(top: 5, right: 5, child: FavoriteIconButton(itemId: item_.id)),
            // const Positioned(bottom: 5, right: 5, child: AddToCartFavourite()),
          ],
        ),
      ),
    );
  }
}

class AddToCartFavourite extends StatefulWidget {
  const AddToCartFavourite({super.key});

  @override
  State<AddToCartFavourite> createState() => _AddToCartFavouriteState();
}

class _AddToCartFavouriteState extends State<AddToCartFavourite> {
  bool addingToCart = false;

  void _addToCart() async {
    if (!addingToCart) {
      setState(() => addingToCart = true);

      /// todo : add to cart
      await Future.delayed(const Duration(milliseconds: 2000), () {});

      setState(() => addingToCart = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Item Added to Cart"), duration: Duration(milliseconds: 800)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: 110,
      child: FilledButton(
        onPressed: _addToCart,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: addingToCart
              ? AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: CircularProgressIndicator(strokeWidth: 2, color: getColorScheme(context).onPrimary),
                  ),
                )
              : const Text('Add To Cart', style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key, required this.itemId});

  final String itemId;

  Future<void> _removeFromFavorites() async {
    final favoriteController = FavoriteController.instance;
    favoriteController.removeFromFavorites(itemId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton.filledTonal(
        onPressed: _removeFromFavorites,
        tooltip: "Add To Favorites",
        style: IconButton.styleFrom(padding: const EdgeInsets.all(0), backgroundColor: getColorScheme(context).tertiaryContainer),
        icon: Icon(Icons.favorite_rounded, color: getColorScheme(context).error, size: 18.5),
      ),
    );
  }
}
