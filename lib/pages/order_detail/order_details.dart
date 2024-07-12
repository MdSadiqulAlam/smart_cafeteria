import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/model/test_model/order_info.dart';
import '../payment_screens/checkout_bottom_sheet.dart';
import 'components/order_detail_component.dart';
import 'components/ordered_item_dropdown.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order_});

  final MyOrderInfo order_;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(
        showTitle: true,
        pageTitle: 'Order Details',
        viewOption: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 3),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyOrderDetailsLabel(label_: 'Order Status'),
            const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: <Widget>[
                MyOrderDetailStatusRow(
                  label: 'Order Created',
                  status: order_.completed ? 'Completed' : 'Pending Pickup',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const MyOrderDetailsLabel(label_: 'Order Details'),
            const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: <Widget>[
                MyOrderDetailStatusRow(
                    label: 'Order Created', status: order_.date),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(
                    label: 'Order Time', status: order_.time),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(
                  label: 'Order ID',
                  status: order_.orderID,
                ),
              ],
            ),
            const SizedBox(height: 10),
            MyOrderDetailsLabel(label_: 'Item Detail (${order_.totalItem})'),
            const SizedBox(height: 7),
            OrderedItemDropDown(order_: order_),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 100,
        ),
        child: FilledButton.tonal(
          onPressed: () {
            checkoutBottomSheet(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              // horizontal: 25,
            ),
            child: Text(
              'Re-Order',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20),
              // style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
