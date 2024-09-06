import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';

import '../../../../config/get_config.dart';
import '../../../../model/test/item_model.dart';
import '../../../../model/test/order_model.dart';
import '../../../item_detail/item_detail.dart';

class OrderedItemCard extends StatelessWidget {
  const OrderedItemCard({
    super.key,
    required this.item_,
    required this.cardHeight,
    required this.orderedItem_,
  });

  final ItemModel item_;
  final double cardHeight;
  final OrderedItemModel orderedItem_;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetail(item_: item_)));
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
                child: Image.asset(item_.imagePath, fit: BoxFit.cover),
              ),
            ),

            /// info
            const SizedBox(width: 13),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item_.name.toCapitalCase(),
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
                    item_.itemDetail,
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
                        text: 'Tk. ${orderedItem_.itemTotalPrice}   ',
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
