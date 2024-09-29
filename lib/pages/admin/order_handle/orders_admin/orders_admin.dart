import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/orders_admin_controller.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/orders_listview_admin.dart';

class OrdersAdmin extends StatelessWidget {
  const OrdersAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAdminController());

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            color: getColorScheme(context).surface,
            child: const TabBar(tabs: <Widget>[Tab(text: 'Pending'), Tab(text: 'Completed')]),
          ),
          const Expanded(
            child: TabBarView(
              children: <Widget>[
                OrdersListviewAdmin(completed: false),
                OrdersListviewAdmin(completed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
