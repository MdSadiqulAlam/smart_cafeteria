import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import 'package:smart_cafeteria/pages/admin/add_new_item/add_new_item.dart';
import 'package:smart_cafeteria/pages/admin/new_note/new_note.dart';
import 'package:smart_cafeteria/pages/admin/notes_admin/notes_admin.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/orders_admin.dart';
import 'package:get/get.dart';
import '../../config/get_config.dart';
import 'manage_items/manage_items.dart';

class PageElement {
  PageElement({required this.pageBody, required this.title});

  final Widget pageBody;
  final String title;
}

List<PageElement> allPages = [
  /// todo: pages
  PageElement(pageBody: const OrdersAdmin(), title: "Orders"),
  PageElement(pageBody: const ManageItems(), title: "Items"),
  PageElement(pageBody: const NotesAdmin(), title: "Notes"),
  PageElement(pageBody: Container(color: Colors.greenAccent.shade200), title: "Statistics"),
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
      appBar: AdminAppbar(
        showTitle: true,
        // showNotification: true,
        // viewProfile: true,
        // currentPage: currentPage,
        pageTitle: allPages[currentPage].title,
        leadingBackArrow: false,
        viewOption: true,
      ),
      body: allPages[currentPage].pageBody,
      bottomNavigationBar: NavigationBar(
        backgroundColor: getColorScheme(context).secondaryContainer,
        indicatorColor: getColorScheme(context).primaryContainer,
        destinations: const [
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
      floatingActionButton: currentPage == 3
          ? const SizedBox.shrink()
          : FloatingActionButton(
              onPressed: () {
                if (currentPage == 1) {
                  Get.to(const AddNewItem());
                } else if (currentPage == 2) {
                  Get.to(const NewNote());
                }
              },
              child: Icon(currentPage == 0 ? Icons.qr_code_outlined : (currentPage == 1 ? Icons.add : Icons.mode_edit_outlined)),
            ),
    );
  }
}
