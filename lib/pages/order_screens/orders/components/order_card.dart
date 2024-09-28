import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/pages/order_screens/order_detail/order_details.dart';
import 'package:smart_cafeteria/pages/payment/checkout_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order_});

  final OrderModel order_;

  @override
  Widget build(BuildContext context) {
    // final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 2;
    final bool brightness = getBrightness(context);

    // Aggregate item names directly from orderedItems
    final String itemNames = order_.orderedItems.map((item) => item.name.toCapitalCase()).join(', ');

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
                      'Order:  ${order_.id.substring(order_.id.length - 10)}',
                      style: getTextTheme(context).titleMedium?.copyWith(color: getColorScheme(context).onSecondaryContainer),
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
                  order_.completed ? const SizedBox.shrink() : const Icon(Icons.qr_code_sharp, size: 22),
                ],
              ),

              /// item names
              const SizedBox(height: 3),
              Text(
                itemNames,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    getTextTheme(context).bodyLarge?.copyWith(fontSize: 18, color: getColorScheme(context).onSecondaryContainer),
              ),

              /// info table
              const SizedBox(height: 3),
              MyStatusRow(label: 'Status', status: order_.completed ? 'Completed' : 'Paid'),
              const MyHorizontalDivider(),
              MyStatusRow(label: 'Price (${order_.totalItem} Items)', status: '${order_.totalPaid} Tk'),
              const MyHorizontalDivider(),
              // MyStatusRow(label: order_.completed ? 'Completed On' : 'Paid On', status: '${order_.time} ${order_.date}'),
              MyStatusRow(
                label: order_.completed ? 'Completed On' : 'Paid On',
                status: '${DateFormat('HH:mm').format(order_.orderDate)},  ${DateFormat('MMM dd').format(order_.orderDate)}',
              ),

              /// buttons
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// Details button
                  SizedBox(
                    width: getScreenWidth(context) * 0.34,
                    height: 27,
                    child: FilledButton(
                      onPressed: () => Get.to(() => OrderDetails(order_: order_)),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: brightness
                            ? getColorScheme(context).primaryContainer
                            : getColorScheme(context).primaryContainer.withOpacity(0.57),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: getColorScheme(context).outline.withOpacity(0.6), width: 0.5),
                        ),
                      ),
                      child: Center(
                        child: Text('Details', style: TextStyle(fontSize: 15, color: getColorScheme(context).onPrimaryContainer)),
                      ),
                    ),
                  ),

                  /// Reorder button
                  SizedBox(
                    width: getScreenWidth(context) * 0.34,
                    height: 27,
                    child: FilledButton(
                      onPressed: () {
                        checkoutBottomSheet(context: context, totalPrice: 0);
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: getColorScheme(context).primary.withOpacity(0.85),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Center(child: Text('Re-Order', style: TextStyle(fontSize: 15))),
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
          Text(label,
              style: getTextTheme(context).labelLarge?.copyWith(color: getColorScheme(context).onSurfaceVariant, fontSize: 15)),
          Text(status,
              style:
                  getTextTheme(context).labelSmall?.copyWith(color: getColorScheme(context).onSecondaryContainer, fontSize: 17)),
        ],
      ),
    );
  }
}
