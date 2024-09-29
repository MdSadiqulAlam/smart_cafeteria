import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/order_data.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/model/user_order_data.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/order_detail_admin/ordered_item_card_admin.dart';
import 'package:smart_cafeteria/pages/order_screens/order_detail/components/order_detail_component.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';

class OrderDetailsAdmin extends StatelessWidget {
  const OrderDetailsAdmin({super.key, required this.order_});

  final OrderModel order_;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(showTitle: true, pageTitle: 'Order Details', titlePadding: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 3),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const MyOrderDetailsLabel(label_: 'Order Status'),
            // // const SizedBox(height: 1),
            // MyOrderDetailContainer(
            //   components_: <Widget>[
            //     MyOrderDetailStatusRow(
            //       label: 'Status',
            //       status: order_.completed ? 'Completed' : 'Pending Pickup',
            //       colorStatus: true,
            //       statusColor: order_.completed ? Colors.green : Colors.amber.shade900.withOpacity(0.9),
            //     ),
            //   ],
            // ),

            /// order details
            const SizedBox(height: 7),
            const MyOrderDetailsLabel(label_: 'Order Details'),
            // const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: <Widget>[
                MyOrderDetailStatusRow(label: 'Order ID', status: order_.id),
                // MyOrderDetailStatusRow(label: 'Order Created', status: order_.date),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(
                  label: 'Status',
                  status: order_.completed ? 'Completed' : 'Pending Pickup',
                  colorStatus: true,
                  statusColor: order_.completed ? Colors.green : Colors.amber.shade900.withOpacity(0.9),
                ),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(
                    label: 'Order Time',
                    status:
                        '${DateFormat('HH:mm').format(order_.orderDate)} | ${DateFormat('MMM dd, yy').format(order_.orderDate)}'),
                // const MyOrderDetailHorizontalDivider(),
              ],
            ),

            /// item details
            const SizedBox(height: 7),
            MyOrderDetailsLabel(label_: 'Item Detail (${order_.totalItem})'),
            // const SizedBox(height: 7),
            MyOrderDetailContainer(
              components_: [
                MyOrderDetailStatusRow(label: 'Total Items', status: '${order_.totalItem} '),
                Column(
                  children: [
                    const SizedBox(height: 7),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: order_.orderedItems.length,
                      separatorBuilder: (_, __) => Divider(color: getColorScheme(context).onSurfaceVariant),
                      itemBuilder: (_, int index) {
                        OrderedItemModel orderedItem_ = order_.orderedItems[index];
                        return OrderedItemCardAdmin(orderedItem_: orderedItem_);
                        // return OrderedItemCard(orderedItem_: orderedItem_);
                      },
                    ),
                  ],
                ),
                const MyOrderDetailHorizontalDivider(),
                MyOrderDetailStatusRow(label: 'Total Price', status: '= Tk. ${order_.totalPaid}         '),
                const SizedBox(height: 5),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: CompleteOrderButtonAdmin(order: order_),
    );
  }
}

class CompleteOrderButtonAdmin extends StatelessWidget {
  CompleteOrderButtonAdmin({super.key, required this.order});

  final OrderModel order;

  final isLoading = false.obs;

  Future<void> _completeOrder() async {
    if (isLoading.value == false) {
      isLoading.value = true;
      try {
        final completedOrder = order.copyWith(completed: true, orderDate: DateTime.now());
        await PendingOrdersData().moveToCompleted(completedOrder);
        await UserOrderData().completeOrder(order.id, userId: order.userId);
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text("Order completed"), duration: Duration(milliseconds: 800)),
        );
      } catch (e) {
        MyLoadingWidgets.errorSnackBar(title: 'Order completion failed!', message: 'Error: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 60),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: isLoading.value
              ? FilledButton.tonal(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    side: BorderSide(color: getColorScheme(context).outlineVariant), // Change color and width as needed
                    padding: const EdgeInsets.symmetric(vertical: 8), // Padding for button
                  ),
                  child: LoadingAnimationWidget.fourRotatingDots(color: getColorScheme(context).onSecondaryContainer, size: 30),
                )
              : FilledButton.tonal(
                  onPressed: () => _completeOrder(),
                  style: FilledButton.styleFrom(
                    side: BorderSide(color: getColorScheme(context).outlineVariant), // Change color and width as needed
                    padding: const EdgeInsets.symmetric(vertical: 8), // Padding for button
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Complete Order  ', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20)),
                      const Icon(Icons.check, color: Colors.green)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
