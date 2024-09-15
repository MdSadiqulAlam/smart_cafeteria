import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_controller.dart';
import 'package:smart_cafeteria/config/get_config.dart';

import 'components/manage_items_listview.dart';

class ManageItems extends StatelessWidget {
  const ManageItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManageItemsController());

    return Column(
      children: <Widget>[
        /// search field
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: getColorScheme(context).surface,
          height: 70,
          child: TextFormField(
            controller: controller.searchItem,
            expands: false,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              // label: Text('Search'),
              labelText: 'Search Item',
            ),
          ),
        ),

        /// Item Tab bar
        Container(
          color: getColorScheme(context).surface,
          child: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            tabs: const <Widget>[
              Tab(text: 'All Items'),
              Tab(text: 'Breakfast'),
              Tab(text: 'Beverage'),
              Tab(text: 'Lunch'),
              Tab(text: 'Snacks'),
              Tab(text: 'Ice-Cream'),
            ],
          ),
        ),

        /// tab bar body
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: const <Widget>[
              ManageItemsListview(),
              ManageItemsListview(),
              ManageItemsListview(),
              ManageItemsListview(),
              ManageItemsListview(),
              ManageItemsListview(),
            ],
          ),
        ),
      ],
    );
  }
}
