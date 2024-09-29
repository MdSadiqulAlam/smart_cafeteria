import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/orders_listview.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        children: <Widget>[
          Container(
            color: getColorScheme(context).surface,
            child: const TabBar(tabs: <Widget>[Tab(text: 'All'), Tab(text: 'Pending'), Tab(text: 'Completed')]),
          ),
          const Expanded(
            child: TabBarView(
              children: <Widget>[
                OrdersListview(),
                OrdersListview(filter: true, completed: false),
                OrdersListview(filter: true, completed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
