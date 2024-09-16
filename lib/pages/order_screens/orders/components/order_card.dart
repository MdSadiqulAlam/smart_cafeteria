import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/model/test/order_model.dart';
import 'package:smart_cafeteria/pages/order_screens/order_detail/order_details.dart';
import 'package:smart_cafeteria/pages/payment/checkout_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order_});

  final OrderModel order_;

  @override
  Widget build(BuildContext context) {
    // final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 2;
    final bool brightness = getBrightness(context);
    // Aggregate item names
    final String itemNames = order_.orderedItems.map((item) {
      return testAllItems[item.itemIndex].name.toCapitalCase();
    }).join(', ');

    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Getting QR code"), duration: Duration(milliseconds: 700)),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
              /// order id and status
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Order: ${order_.orderID}',
                      style: getTextTheme(context).titleMedium?.copyWith(
                            color: getColorScheme(context).onSecondaryContainer,
                          ),
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
                            color: order_.completed ? Colors.green : Colors.amber.shade800,
                          ),
                    ),
                  ),
                  order_.completed ? const SizedBox.shrink() : const Icon(Icons.qr_code_sharp, size: 20),
                ],
              ),

              /// item names
              const SizedBox(height: 1),
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

              /// info table
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

              /// buttons
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Details button
                  SizedBox(
                    width: getScreenWidth(context) * 0.33,
                    height: 35,
                    child: FilledButton(
                      onPressed: () {
                        Get.to(() => OrderDetails(order_: order_));
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: brightness
                            ? getColorScheme(context).primaryContainer
                            : getColorScheme(context).primaryContainer.withOpacity(0.57),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          'Details',
                          style: TextStyle(fontSize: 18, color: getColorScheme(context).onPrimaryContainer),
                        ),
                      ),
                    ),
                  ),

                  /// Reorder button
                  SizedBox(
                    width: getScreenWidth(context) * 0.33,
                    height: 35,
                    child: FilledButton(
                      onPressed: () {
                        checkoutBottomSheet(context);
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: getColorScheme(context).primary.withOpacity(0.85),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Center(child: Text('Re-Order', style: TextStyle(fontSize: 18))),
                    ),
                  ),
                ],
              ),
              order_.completed
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Text('Tap to get QRCode',
                          style: TextStyle(
                              color: getColorScheme(context).onSecondaryContainer, fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHorizontalDivider extends StatelessWidget {
  const MyHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(color: getColorScheme(context).outlineVariant, height: 5, thickness: 1.5),
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
            style: getTextTheme(context).labelLarge?.copyWith(color: getColorScheme(context).outline, fontSize: 15),
          ),
          Text(
            status,
            style: getTextTheme(context).labelSmall?.copyWith(color: getColorScheme(context).onSecondaryContainer, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
