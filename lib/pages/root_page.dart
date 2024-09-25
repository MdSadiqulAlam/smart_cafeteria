import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/cart/cart.dart';
import 'package:smart_cafeteria/pages/favorites/favorites.dart';
import 'package:smart_cafeteria/pages/homepage/homepage.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/orders.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
