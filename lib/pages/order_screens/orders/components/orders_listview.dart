import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_card.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_controller.dart';
import 'package:smart_cafeteria/config/get_config.dart';

class OrdersListview extends StatelessWidget {
  const OrdersListview({super.key, this.filter = false, this.completed = false});

  final bool filter;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final orderController = OrderController.instance; // Access the OrderController

      // Display loading indicator while data is being fetched
      if (orderController.isLoading.value == true) {
        return const Center(child: CircularProgressIndicator());
      }
      // Determine which orders to display based on the filter
      final displayedOrders = filter
          ? (completed ? orderController.completedOrders : orderController.pendingOrders)
          : [...orderController.pendingOrders, ...orderController.completedOrders];

      // If displayedOrders is empty, show a message
      if (displayedOrders.isEmpty) {
        return Center(child: Text('No Orders to show!', style: getTextTheme(context).bodyLarge));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
        physics: const BouncingScrollPhysics(),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: displayedOrders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 15),
          itemBuilder: (_, int index) {
            final OrderModel order_ = displayedOrders[index];
            return OrderCard(order_: order_);
          },
        ),
      );
    });
  }
}
