import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';

class ManageItemsCardAdmin extends StatelessWidget {
  const ManageItemsCardAdmin({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    // Ensure ratingCount is not null or zero
    final num ratingCount = item_.ratingCount == 0 ? 1 : item_.ratingCount;

    // Ensure ratingMap is not null and provide default values for missing keys
    final Map<num, num> ratingMap = {
      1: item_.ratingMap[1] ?? 0,
      2: item_.ratingMap[2] ?? 0,
      3: item_.ratingMap[3] ?? 0,
      4: item_.ratingMap[4] ?? 0,
      5: item_.ratingMap[5] ?? 0,
    };

    // Calculate rating, ensuring no division by zero
    final num rating = fixedPrecision(
        (5 * ratingMap[5]! + 4 * ratingMap[4]! + 3 * ratingMap[3]! + 2 * ratingMap[2]! + 1 * ratingMap[1]!) / ratingCount);
    return InkWell(
      onTap: () {
        /// old
        // Get.to(()=>ItemDetail(item_: item_));
        // Get.to(() => ItemDetail(item_: item_));
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
                      child: Image.network(item_.imagePath, fit: BoxFit.cover),
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
                        itemSize: 20,
                        unratedColor: Colors.white,
                        itemBuilder: (_, __) => Icon(Icons.star_sharp, color: Colors.amber.shade700),
                      ),
                      Text(
                        "$rating  | sold:${item_.itemSold}",
                        style: getTextTheme(context).labelLarge?.copyWith(color: getColorScheme(context).onSecondaryContainer),
                      ),
                    ],
                  ),
                ),

                /// price
                const SizedBox(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    "TK. ${item_.price}",
                    style: getTextTheme(context).titleSmall?.copyWith(
                          color: getColorScheme(context).onSecondaryContainer,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),

            /// favorite button
            Positioned(
              top: 8,
              right: 7,
              child: SizedBox(
                height: 33,
                width: 33,
                child: IconButton.filledTonal(
                  color: getColorScheme(context).tertiaryContainer,
                  onPressed: () {},
                  tooltip: "Add To Favorites",
                  style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
                  icon: Icon(Icons.edit, color: getColorScheme(context).onTertiaryContainer, size: 24),
                ),
              ),
            ),

            /// add to cart
            // Positioned(bottom: 5, right: 5, child: AddToCartOutlineButton(item_: item_)),
          ],
        ),
      ),
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(1));
}
