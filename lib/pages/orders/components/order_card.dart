import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/order_detail/order_details.dart';

import '../../../config/get_config.dart';
import '../../../model/test_model/item_info.dart';
import '../../../model/test_model/order_info.dart';
import '../../payment_screens/checkout_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order_,
  });

  final MyOrderInfo order_;

  @override
  Widget build(BuildContext context) {
    // final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 2;
    final bool brightness = getBrightness(context);
    // Aggregate item names
    final String itemNames = order_.orderedItems.map((item) {
      return allItems[item.itemIndex].name.toCapitalCase();
    }).join(', ');

    return Container(
      // height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: order_.completed
        //     ? getColorScheme(context).secondaryContainer
        //     : brightness
        //         ? getColorScheme(context).primaryFixed.withOpacity(0.8)
        //         : getColorScheme(context).onPrimaryFixedVariant,
        color: brightness
            ? getColorScheme(context).secondaryContainer
            : getColorScheme(context).secondaryContainer.withOpacity(0.85),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order: ${order_.orderID}',
                  style: getTextTheme(context).titleMedium?.copyWith(
                        color: getColorScheme(context).onSecondaryContainer,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    order_.completed ? 'Completed' : 'Pending Pickup',
                    style: getTextTheme(context).labelLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: order_.completed
                              ? Colors.green
                              : Colors.amber.shade800,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              itemNames,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getTextTheme(context).titleSmall?.copyWith(
                    fontSize: 18,
                    color: getColorScheme(context).onSecondaryContainer,
                    // fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 7),
            MyStatusRow(
              label: 'Status',
              status: order_.completed ? 'Completed' : 'Paid',
            ),
            const MyHorizontalDivider(),
            MyStatusRow(
              label: 'Price (${order_.totalItem} Items)',
              status: '${order_.totalPaid} Tk',
            ),
            const MyHorizontalDivider(),
            MyStatusRow(
              label: order_.completed ? 'Completed On' : 'Paid On',
              status: '${order_.time} ${order_.date}',
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Details button
                SizedBox(
                  width: getScreenWidth(context) * 0.35,
                  child: FilledButton(
                    onPressed: () {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text("Order tapped"),
                      //     duration: Duration(milliseconds: 700),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetails(order_: order_),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: brightness
                          ? getColorScheme(context).primaryContainer
                          : getColorScheme(context)
                              .primaryContainer
                              .withOpacity(0.57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: getColorScheme(context).onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),
                // Reorder button
                SizedBox(
                  width: getScreenWidth(context) * 0.35,
                  child: FilledButton(
                    onPressed: () {
                      checkoutBottomSheet(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          getColorScheme(context).primary.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: const Center(
                      child: Text('Re-Order', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyHorizontalDivider extends StatelessWidget {
  const MyHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: getColorScheme(context).outlineVariant,
        height: 5,
        thickness: 1.5,
      ),
    );
  }
}

class MyStatusRow extends StatelessWidget {
  const MyStatusRow({super.key, required this.label, required this.status});

  final String label;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: getTextTheme(context).labelLarge?.copyWith(
                  color: getColorScheme(context).outline,
                  fontSize: 15,
                ),
          ),
          Text(
            status,
            style: getTextTheme(context).labelSmall?.copyWith(
                  color: getColorScheme(context).onSecondaryContainer,
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
