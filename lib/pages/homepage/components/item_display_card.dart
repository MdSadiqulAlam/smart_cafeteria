import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';

import '../../item_detail/item_detail.dart';

class ItemCardGridView extends StatelessWidget {
  const ItemCardGridView({
    super.key,
    required this.item_,
  });

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    final double ratingCount = item_.ratingCount;
    final Map<double, double> ratingMap = item_.ratingMap;
    final double rating = fixedPrecision(
        (5 * ratingMap[5]! + 4 * ratingMap[4]! + 3 * ratingMap[3]! + 2 * ratingMap[2]! + 1 * ratingMap[1]!) / ratingCount);

    return InkWell(
      onTap: () {
        /// old
        // Get.to(()=>ItemDetail(item_: item_));
        Get.to(() => ItemDetail(item_: item_));
      },
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(item_.imagePath, fit: BoxFit.cover),
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
                          fontWeight: FontWeight.bold,
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
            const Positioned(top: 8, right: 7, child: FavoriteIconButton()),

            /// add to cart
            Positioned(bottom: 5, right: 5, child: AddToCartOutlineButton(item_: item_)),
          ],
        ),
      ),
    );
  }
}

class AddToCartOutlineButton extends StatelessWidget {
  const AddToCartOutlineButton({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: 27,
      child: IconButton.outlined(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${item_.name} added to cart"), duration: const Duration(milliseconds: 700)),
          );
        },
        tooltip: "Add To Cart",
        style: IconButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(width: 2, color: getColorScheme(context).outline),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key});

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool favorite_ = false;

  void _toggleFavorite() {
    setState(() {
      favorite_ = !favorite_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton.filledTonal(
        onPressed: _toggleFavorite,
        tooltip: "Add To Favorites",
        style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
        icon: Icon(
          favorite_ ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: Theme.of(context).colorScheme.error,
          size: favorite_ ? 21 : 18,
        ),
      ),
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(1));
}
