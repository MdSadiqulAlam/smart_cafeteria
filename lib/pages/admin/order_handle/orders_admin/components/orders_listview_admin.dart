import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/test/order_model.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/order_card_admin.dart';

class OrdersListviewAdmin extends StatelessWidget {
  const OrdersListviewAdmin({super.key, this.completed = false});

  final bool completed;

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> filteredOrders = (completed ? completedOrders : pendingOrders);

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
  }
}
