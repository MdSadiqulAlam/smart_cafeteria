import 'package:flutter/material.dart';
import 'components/orders_listview.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
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
        // color: getColorScheme(context).surface,
        TabBar(
          controller: _tabController,
          tabs: const <Widget>[Tab(text: 'All'), Tab(text: 'Pending'), Tab(text: 'Completed')],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              OrdersListview(),
              OrdersListview(filter: true, completed: false),
              OrdersListview(filter: true, completed: true),
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(child: Text('Overview tab')),
              // ),
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(child: Text('Specifications tab')),
              // ),
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(child: Text('ululu tab')),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
