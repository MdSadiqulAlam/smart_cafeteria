import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/cart/cart.dart';
import 'package:smart_cafeteria/pages/favorites/favorites.dart';
import 'package:smart_cafeteria/pages/homepage/homepage.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_controller.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/orders.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';
import 'package:smart_cafeteria/pages/cart/components/cart_controller.dart';
import 'package:smart_cafeteria/pages/favorites/components/favorite_controller.dart';

class PageElement {
  final Widget pageBody;
  final String title;
  final String tag;

  PageElement({required this.pageBody, required this.title, required this.tag});
}

List<PageElement> allPages = [
  PageElement(pageBody: const MyHomePage(), title: "HomePage", tag: "homepage"),
  PageElement(pageBody: const Favorites(), title: "", tag: "favorites"),
  PageElement(pageBody: const MyCart(), title: "", tag: "cart"),
  PageElement(pageBody: const MyOrders(), title: "", tag: "orders"),
];

class RootPage extends StatefulWidget {
  final int initialPage;

  const RootPage({super.key, this.initialPage = 0});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;

    /// initiate all the controllers
    Get.put(ItemDisplayController());
    Get.put(FavoriteController());
    Get.put(CartController());
    // Get.put(OrderController());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show exit confirmation dialog and return true if the user wants to exit
        return await _showExitDialog(context);
      },
      child: Scaffold(
        // drawer: AppbarMenu(),
        appBar: MyAppbar(
          showTitle: true,
          showNotification: true,
          viewProfile: true,
          pageTitle: allPages[currentPage].title,
          leadingBackArrow: false,
        ),
        body: allPages[currentPage].pageBody,
        bottomNavigationBar: NavigationBar(
          backgroundColor: getColorScheme(context).secondaryContainer,
          indicatorColor: getColorScheme(context).primaryContainer,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
            NavigationDestination(icon: Icon(Icons.view_list_rounded), label: "Orders"),
          ],
          selectedIndex: currentPage,
          onDestinationSelected: (int index) => setState(() => currentPage = index),
        ),
      ),
    );
  }

  // Function to show the exit confirmation dialog
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // Stay in the app
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // Exit the app
                child: const Text("Exit"),
              ),
            ],
          ),
        ) ??
        false; // If the dialog is dismissed, return false
  }
}
