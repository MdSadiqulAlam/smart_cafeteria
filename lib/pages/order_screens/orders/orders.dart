import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/orders_listview.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_controller.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());


    return Column(
      children: <Widget>[
        Container(
          color: getColorScheme(context).surface,
          child: TabBar(
            controller: orderController.tabController,
            tabs: const <Widget>[Tab(text: 'All'), Tab(text: 'Pending'), Tab(text: 'Completed')],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: orderController.tabController,
            children: const <Widget>[
              OrdersListview(),
              OrdersListview(),
              OrdersListview(),
            ],
          ),
        ),
      ],
    );
  }
}
