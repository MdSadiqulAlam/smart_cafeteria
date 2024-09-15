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

  PageElement({required this.pageBody, required this.title});
}

List<PageElement> allPages = [
  PageElement(pageBody: const MyHomePage(), title: "HomePage"),
  PageElement(pageBody: const Favorites(), title: "Favorites"),
  PageElement(pageBody: const MyCart(), title: "Cart"),
  PageElement(pageBody: const MyOrders(), title: "Orders")
];

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // print(FirebaseAuth.instance.currentUser);
    return Scaffold(
      // drawer: AppbarMenu(),
      appBar: MyAppbar(
        showTitle: true,
        showNotification: true,
        viewProfile: true,
        // currentPage: currentPage,
        pageTitle: allPages[currentPage].title,
        leadingBackArrow: false,
      ),
      body: allPages[currentPage].pageBody,
      bottomNavigationBar: NavigationBar(
        backgroundColor: getColorScheme(context).secondaryContainer,
        indicatorColor: getColorScheme(context).primaryContainer,
        destinations: [
          NavigationDestination(
            // icon: Icon(currentPage == 0 ? Icons.home_filled : Icons.home),
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 1 ? Icons.favorite : Icons.favorite_outline),
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 3 ? Icons.view_list_rounded : Icons.view_agenda_outlined),
            icon: Icon(Icons.view_list_rounded),
            label: "Orders",
          ),
        ],
        selectedIndex: currentPage,
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}