import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/model/order_model.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/order_card_admin.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/orders_admin_controller.dart';
import 'package:smart_cafeteria/config/get_config.dart';

class OrdersListviewAdmin extends StatelessWidget {
  const OrdersListviewAdmin({super.key, this.completed = false});

  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = OrdersAdminController.instance;

      // Display loading indicator while data is being fetched
      if (controller.isLoading.value == true) {
        return const Center(child: CircularProgressIndicator());
      }

      final filteredOrders = (completed ? controller.completedOrders : controller.pendingOrders);
      if (filteredOrders.isEmpty) {
        return Center(child: Text('No Orders to show!', style: getTextTheme(context).bodyLarge));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
        physics: const BouncingScrollPhysics(),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filteredOrders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 15),
          itemBuilder: (_, int index) {
            final OrderModel order_ = filteredOrders[index];
            return OrderCardAdmin(order_: order_);
          },
        ),
      );
    });
  }
}
