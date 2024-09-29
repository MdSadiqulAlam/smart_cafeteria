import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/order_detail_admin/order_details_admin.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_card.dart';

class OrderCardAdmin extends StatelessWidget {
  const OrderCardAdmin({super.key, required this.order_});

  final OrderModel order_;

  @override
  Widget build(BuildContext context) {
    // final double cardHeight = const Size.fromHeight(kToolbarHeight).height * 2;
    final bool brightness = getBrightness(context);

    return InkWell(
      onTap: () {
        Get.to(() => OrderDetailsAdmin(order_: order_));
        // Get.to(()=>OrderDetails(order_: order_));
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
                  // order_.completed ? const SizedBox.shrink() : const Icon(Icons.qr_code_sharp, size: 20),
                ],
              ),

              /// info table
              const SizedBox(height: 10),
              MyStatusRow(label: 'Status', status: order_.completed ? 'Completed' : 'Paid'),
              const MyHorizontalDivider(),
              MyStatusRow(label: 'Price (${order_.totalItem} Items)', status: '${order_.totalPaid} Tk'),
              const MyHorizontalDivider(),
              MyStatusRow(
                label: order_.completed ? 'Completed On' : 'Paid On',
                status: '${DateFormat('HH:mm').format(order_.orderDate)},  ${DateFormat('MMM dd').format(order_.orderDate)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
