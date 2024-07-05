import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/model/test_model/item_info.dart';
import 'package:smart_cafeteria/pages/item_detail/components/favourite_icon_item_detail.dart';
import 'package:smart_cafeteria/pages/item_detail/components/rating_segment.dart';

import 'components/add_to_cart_segment.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item_});

  final MyItemInfo item_;

  @override
  Widget build(BuildContext context) {
    final double ratingCount = item_.ratingCount;
    final Map<double, double> ratingMap = item_.ratingMap;
    final double rating = fixedPrecision((5 * ratingMap[5]! +
            4 * ratingMap[4]! +
            3 * ratingMap[3]! +
            2 * ratingMap[2]! +
            1 * ratingMap[1]!) /
        ratingCount);

    return Scaffold(
      appBar: const MyAppbar(showNotification: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item_.imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 3,
                    child: FavoriteIconButtonItemDetail(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item_.name.toCapitalCase(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      "  (${item_.itemDetail})",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.monetization_on_outlined,
                      // color:Theme.of(context).colorScheme.onSecondaryContainer,
                      color: Colors.green[600],
                      size: Theme.of(context).textTheme.titleLarge?.fontSize,
                      // weight: 123,
                    ),
                    Text(
                      "${item_.price} Tk",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      // color:Theme.of(context).colorScheme.onSecondaryContainer,
                      color: Colors.amber[800],
                      size: Theme.of(context).textTheme.titleLarge?.fontSize,
                    ),
                    Text(
                      "${item_.kcal}kCal",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      // color:Theme.of(context).colorScheme.onSecondaryContainer,
                      color: Colors.amber[600],
                      size:
                          Theme.of(context).textTheme.titleLarge!.fontSize! + 3,
                      // weight: 123,
                    ),
                    Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Description",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item_.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ratings",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ratings and reviews are verified and are from people who have ordered the same food",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            RatingSegment(
              rating: rating,
              ratingCount: ratingCount,
              ratingMap: ratingMap,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: const AddToCartSegment(),
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(1));
}
