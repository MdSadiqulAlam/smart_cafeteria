import 'package:cached_network_image/cached_network_image.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_model.dart';

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({super.key, required this.orderedItem_});

  // final ItemModel item_;
  final OrderedItemModel orderedItem_;

  @override
  Widget build(BuildContext context) {
    final double cardHeight = getAppBarHeight() * 1.49;
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(item_: item_)));
      },
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: getColorScheme(context).primaryContainer.withOpacity(getBrightness(context) ? 0.6 : 0.3),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            AspectRatio(
              aspectRatio: 0.95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: orderedItem_.imagePath,
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

            /// info
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderedItem_.name.toCapitalCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getTextTheme(context).headlineSmall?.copyWith(
                        color: getColorScheme(context).onSecondaryContainer,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 1),
                SizedBox(
                  width: getScreenWidth(context) * 0.55,
                  child: Text(
                    orderedItem_.itemDetail,
                    style: getTextTheme(context).labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.8),
                          fontSize: 13,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        // "Tk. ${int.parse(item_.price) * quantity}",
                        text: 'Tk. ${orderedItem_.itemPrice}   ',
                        style: getTextTheme(context).titleSmall?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                              fontSize: 19,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        // "Tk. ${int.parse(item_.price) * quantity}",
                        text: 'Qty. ${orderedItem_.quantity}',
                        style: getTextTheme(context).titleSmall?.copyWith(
                              color: getColorScheme(context).onSecondaryContainer,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
