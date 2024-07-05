import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/cart/cart.dart';
import 'package:smart_cafeteria/pages/favorites/favorites.dart';
import 'package:smart_cafeteria/pages/homepage/homepage.dart';
import 'package:smart_cafeteria/pages/orders/orders.dart';
import 'components/appbar.dart';

class PageElement {
  final Widget pageBody;
  final String tittle;

  PageElement({required this.pageBody, required this.tittle});
}

List<PageElement> allPages = [
  PageElement(pageBody: MyHomePage(), tittle: "HomePage"),
  PageElement(pageBody: Favorites(), tittle: "Favorites"),
  PageElement(pageBody: MyCart(), tittle: "Cart"),
  PageElement(pageBody: MyOrders(), tittle: "Orders")
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
    return Scaffold(
      // drawer: AppbarMenu(),
      appBar: MyAppbar(
        showTitle: true,
        showNotification: true,
        viewProfile: true,
        currentPage: currentPage,
        pageTitle: allPages[currentPage].tittle,
      ),
      body: allPages[currentPage].pageBody,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          NavigationDestination(
              icon: Icon(Icons.view_list_rounded), label: "Orders"),
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
