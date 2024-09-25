import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/pages/item_detail/components/favourite_icon_item_detail.dart';
import 'package:smart_cafeteria/pages/item_detail/components/rating_segment.dart';

import 'components/add_to_cart_segment.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    final double ratingCount = item_.ratingCount ?? 1;
    final Map<double, double> ratingMap = item_.ratingMap;
    double rating = fixedPrecision((5 * (ratingMap[5] ?? 0) +
            4 * (ratingMap[4] ?? 0) +
            3 * (ratingMap[3] ?? 0) +
            2 * (ratingMap[2] ?? 0) +
            1 * (ratingMap[1] ?? 0)) /
        ratingCount);

    if (rating.isNaN || ratingMap.isEmpty || item_.ratingCount==0) {
      rating = 5;
    }

    return Scaffold(
      appBar: const MyAppbar(showNotification: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        // padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            AspectRatio(
              aspectRatio: 1.5,
              child: Stack(
                children: [
                  // ClipRRect(borderRadius: BorderRadius.circular(3), child: Image.asset(item_.imagePath, fit: BoxFit.fill)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
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
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(bottom: 10, right: 3, child: FavoriteIconButtonItemDetail()),
                ],
              ),
            ),

            /// name
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item_.name.toCapitalCase(),
                    style: getTextTheme(context).headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getColorScheme(context).onSurface,
                          fontSize: 27,
                        ),
                  ),
                  Expanded(
                    child: Text(
                      '   x1',
                      style: getTextTheme(context).titleMedium?.copyWith(color: getColorScheme(context).onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ),

            /// product info
            const SizedBox(height: 5),
            Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductInfo(
                  icon_: Icons.monetization_on_outlined,
                  iconColor: Colors.green.shade600,
                  text_: "${item_.price} Tk",
                ),
                ProductInfo(
                  icon_: Icons.local_fire_department_outlined,
                  iconColor: Colors.amber.shade800,
                  text_: "${item_.kcal}kCal",
                ),
                ProductInfo(icon_: Icons.star, iconColor: Colors.amber.shade600, text_: '$rating'),
              ],
            ),

            /// item detail
            const SizedBox(height: 15),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item_.itemDetail,
                  style: getTextTheme(context).headlineMedium?.copyWith(
                        color: getColorScheme(context).onSurfaceVariant,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),

            /// description
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Description",
                style: getTextTheme(context).titleLarge?.copyWith(
                      color: getColorScheme(context).onSurfaceVariant,
                      fontSize: 19.2,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ReadMoreText(
                item_.description,
                lessStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                moreStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.justify,
                trimLines: 3,
                trimMode: TrimMode.Line,
              ),
            ),

            /// rating
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ratings",
                style: getTextTheme(context)
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ratings and reviews are verified and are from people who have ordered the same food",
                style: getTextTheme(context).bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 10),
            RatingSegment(rating: rating, ratingCount: ratingCount, ratingMap: ratingMap),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: const AddToCartSegment(),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key, required this.icon_, required this.iconColor, required this.text_});

  final IconData icon_;
  final Color? iconColor;
  final String text_;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon_, color: iconColor, size: getTextTheme(context).titleLarge?.fontSize),
        Text(
          text_,
          style: getTextTheme(context).titleLarge?.copyWith(color: getColorScheme(context).onSurface),
        ),
      ],
    );
  }
}

double fixedPrecision(double val) {
  return double.parse(val.toStringAsFixed(1));
}
