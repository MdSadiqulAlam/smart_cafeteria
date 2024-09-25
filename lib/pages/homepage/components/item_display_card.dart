import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';
import 'package:smart_cafeteria/pages/item_detail/item_detail.dart';
import 'package:smart_cafeteria/model/favorite_data.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/pages/root_page.dart';

class ItemCardGridView extends StatelessWidget {
  const ItemCardGridView({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    double ratingCount = item_.ratingCount ?? 0;

    Map<double, double> ratingMap = item_.ratingMap;
    double rating = fixedPrecision((5 * (ratingMap[5] ?? 0) +
            4 * (ratingMap[4] ?? 0) +
            3 * (ratingMap[3] ?? 0) +
            2 * (ratingMap[2] ?? 0) +
            1 * (ratingMap[1] ?? 0)) /
        (ratingCount == 0 ? 1 : ratingCount));

    if (rating.isNaN || ratingMap.isEmpty || ratingCount.isNaN || ratingCount == 0) {
      rating = 5;
    }

    return InkWell(
      onTap: () => Get.to(() => ItemDetail(item_: item_)),
      // splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      // radius: 50,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: getColorScheme(context).secondaryContainer),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// image
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                //   child: AspectRatio(
                //     aspectRatio: 1.5,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(12),
                //       child: Image.asset(item_.imagePath, fit: BoxFit.cover),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: item_.imagePath,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: LoadingAnimationWidget.stretchedDots(color: getColorScheme(context).onSurface, size: 30),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                /// name
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 1.5),
                  child: Text(
                    item_.name.toCapitalCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                    style: getTextTheme(context).headlineSmall?.copyWith(
                          color: getColorScheme(context).onSecondaryContainer,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),

                /// rating and sold
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBarIndicator(
                        itemCount: 1,
                        rating: fixedPrecision(rating / 5),
                        itemSize: 17,
                        unratedColor: Colors.white,
                        itemBuilder: (_, __) => Icon(Icons.star_sharp, color: Colors.amber.shade700),
                      ),
                      Text(
                        "$rating  | sold:${item_.itemSold}",
                        style: getTextTheme(context).labelMedium?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                            ),
                      ),
                    ],
                  ),
                ),

                /// price , calories
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    children: [
                      Text(
                        "TK. ${item_.price}",
                        style: getTextTheme(context).titleSmall?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "   | ",
                        style: getTextTheme(context).labelLarge?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                            ),
                      ),
                      Icon(
                        Icons.local_fire_department_outlined,
                        color: getColorScheme(context).onSecondaryContainer,
                        size: getTextTheme(context).labelLarge?.fontSize,
                        // weight: 123,
                      ),
                      Text(
                        "${item_.kcal} Cal",
                        style: getTextTheme(context).labelLarge?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// favorite button
            Positioned(top: 8, right: 7, child: FavoriteIconButton(itemId: item_.id)),
            // Positioned(top: 8, right: 7, child: FavoriteIconButtonFrontend()),

            /// add to cart
            Positioned(bottom: 5, right: 5, child: AddToCartOutlineButton(itemId: item_.id)),
          ],
        ),
      ),
    );
  }
}

class AddToCartOutlineButton extends StatelessWidget {
  const AddToCartOutlineButton({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final itemDisplayController = ItemDisplayController.instance; // Create an instance of CartController

    return SizedBox(
      height: 27,
      width: 27,
      child: IconButton.filled(
        onPressed: () async {
          // Add item to cart in Firestore using ItemDisplayController
          await itemDisplayController.addItemToCart(itemId, 1);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Item added to cart"),
              duration: const Duration(milliseconds: 3000),
              action: SnackBarAction(
                label: 'Go to Cart',
                textColor: getColorScheme(context).onPrimaryContainer,
                backgroundColor: getColorScheme(context).primaryContainer,
                onPressed: () {
                  if (Get.currentRoute == '/RootPage') {
                    Get.offAll(() => const RootPage(initialPage: 2));
                  } else {
                    Get.to(() => const RootPage(initialPage: 2));
                  }
                },
              ),
            ),
          );
        },
        tooltip: "Add To Cart",
        style: IconButton.styleFrom(
          backgroundColor: getColorScheme(context).primary.withOpacity(0.9),
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // side: BorderSide(width: 2, color: getColorScheme(context).outline),
        ),
        icon: const Icon(Icons.add_shopping_cart_outlined, size: 16),
      ),
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  final String itemId;

  const FavoriteIconButton({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    // Use ItemDisplayController to manage favorite status
    final itemDisplayController = ItemDisplayController.instance;
    // Check if the item is in the user's favorites
    final isFavorite = itemDisplayController.favoriteItemIds.contains(itemId).obs;

    final favoriteData = FavoriteData();

    return Obx(
      () {
        return SizedBox(
          height: 32,
          width: 32,
          child: IconButton.filledTonal(
            onPressed: () async {
              try {
                if (isFavorite.value) {
                  // Remove item from favorites in Firestore and update locally
                  await favoriteData.removeFavoriteItem(itemId);
                  itemDisplayController.favoriteItemIds.remove(itemId);
                } else {
                  // Add item to favorites in Firestore and update locally
                  await favoriteData.addFavoriteItem(itemId);
                  itemDisplayController.favoriteItemIds.add(itemId);
                }
                isFavorite.value = !isFavorite.value; // Toggle the observable value
              } catch (e) {
                MyLoadingWidgets.errorSnackBar(
                  title: 'Oh Snap!',
                  message: 'Error updating favorite status: $e',
                );
              }
            },
            // tooltip: isFavorite.value ? "Remove from Favorites" : "Add to Favorites",
            style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
            icon: Icon(
              isFavorite.value ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: getColorScheme(context).error,
              size: isFavorite.value ? 21 : 18,
            ),
          ),
        );
      },
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(1));
}
