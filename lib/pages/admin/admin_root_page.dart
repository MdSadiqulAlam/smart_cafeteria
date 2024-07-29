import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../config/get_config.dart';
import '../homepage/homepage.dart';

class PageElement {
  PageElement({required this.pageBody, required this.tittle});

  final Widget pageBody;
  final String tittle;
}

List<PageElement> allPages = [
  /// todo: pages
  PageElement(pageBody: MyHomePage(), tittle: "HomePage"),
  PageElement(pageBody: MyHomePage(), tittle: "HomePage"),
  PageElement(pageBody: MyHomePage(), tittle: "HomePage"),
  PageElement(pageBody: MyHomePage(), tittle: "HomePage"),
];

class AdminRootPage extends StatefulWidget {
  const AdminRootPage({super.key});

  @override
  State<AdminRootPage> createState() => _AdminRootPageState();
}

class _AdminRootPageState extends State<AdminRootPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: AppbarMenu(),
      appBar: MyAppbar(
        showTitle: true,
        showNotification: true,
        viewProfile: true,
        // currentPage: currentPage,
        pageTitle: allPages[currentPage].tittle,
        leadingBackArrow: false,
      ),
      body: allPages[currentPage].pageBody,
      bottomNavigationBar: NavigationBar(
        backgroundColor: getColorScheme(context).secondaryContainer,
        indicatorColor: getColorScheme(context).primaryContainer,
        destinations: [
          NavigationDestination(
            // icon: Icon(currentPage == 0 ? Icons.home_filled : Icons.home),
            // icon: Icon(Icons.event_note),
            // icon: Icon(Icons.checklist),
            // icon: Icon(Icons.view_timeline),
            icon: Icon(Icons.watch_later_outlined),
            label: "Orders",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 1 ? Icons.favorite : Icons.favorite_outline),
            icon: Icon(Icons.playlist_add),
            label: "Items",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            icon: Icon(Icons.edit_note),
            label: "Notes",
          ),
          NavigationDestination(
            // icon: Icon(currentPage == 3 ? Icons.view_list_rounded : Icons.view_agenda_outlined),
            icon: Icon(Icons.timeline),
            label: "Stats",
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
