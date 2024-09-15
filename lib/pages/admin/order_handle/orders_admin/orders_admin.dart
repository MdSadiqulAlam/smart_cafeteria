import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/components/orders_listview_admin.dart';

class OrdersAdmin extends StatefulWidget {
  const OrdersAdmin({super.key});

  @override
  State<OrdersAdmin> createState() => _OrdersAdminState();
}

class _OrdersAdminState extends State<OrdersAdmin> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final timeNow = DateTime.now();
    // print(DateFormat('yMMMMd').format(timeNow));
    // print(DateFormat('Hms').format(timeNow));
    return Column(
      children: <Widget>[
        Container(
          color: getColorScheme(context).surface,
          child: TabBar(
            controller: _tabController,
            tabs: const <Widget>[Tab(text: 'Pending'), Tab(text: 'Completed')],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              OrdersListviewAdmin(completed: false),
              OrdersListviewAdmin(completed: true),
            ],
          ),
        ),
      ],
    );
  }
}
