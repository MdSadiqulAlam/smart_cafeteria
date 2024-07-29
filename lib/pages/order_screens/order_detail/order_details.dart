import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import '../../payment/checkout_bottom_sheet.dart';
import 'components/order_detail_component.dart';
import 'components/ordered_item_dropdown.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order_});

  final OrderModel order_;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(showTitle: true, pageTitle: 'Order Details',titlePadding: false, viewOption: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 3),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// qr code
            order_.completed
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Getting qr code"), duration: const Duration(milliseconds: 700)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: getColorScheme(context).tertiaryContainer.withOpacity(0.85),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_2, size: 35, color: getColorScheme(context).onTertiaryContainer),
                          Text('  Get QR-Code    >>', style: getTextTheme(context).headlineMedium)
                        ],
                      ),
                    ),
                  ),

            /// order status
            order_.completed ? const SizedBox.shrink() : const SizedBox(height: 10),
            const MyOrderDetailsLabel(label_: 'Order Status'),
            const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: <Widget>[
                MyOrderDetailStatusRow(
                  label: 'Status',
                  status: order_.completed ? 'Completed' : 'Pending Pickup',
                  colorStatus: true,
                  statusColor: order_.completed ? Colors.green : Colors.amber.shade900.withOpacity(0.9),
                ),
              ],
            ),

            /// order details
            const SizedBox(height: 10),
            const MyOrderDetailsLabel(label_: 'Order Details'),
            const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: <Widget>[
                MyOrderDetailStatusRow(label: 'Order Created', status: order_.date),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(label: 'Order Time', status: order_.time),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(label: 'Order ID', status: order_.orderID),
              ],
            ),

            /// item details
            const SizedBox(height: 10),
            MyOrderDetailsLabel(label_: 'Item Detail (${order_.totalItem})'),
            const SizedBox(height: 7),
            OrderedItemDropDown(order_: order_),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 100),
        child: FilledButton.tonal(
          onPressed: () {
            checkoutBottomSheet(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Re-Order', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
