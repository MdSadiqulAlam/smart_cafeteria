import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import 'package:smart_cafeteria/pages/admin/add_new_item/add_new_item.dart';
import 'package:smart_cafeteria/pages/admin/new_note/new_note.dart';
import 'package:smart_cafeteria/pages/admin/notes_admin/notes_admin.dart';
import 'package:smart_cafeteria/pages/admin/order_handle/orders_admin/orders_admin.dart';
import 'package:smart_cafeteria/pages/role_based_enter/role_based_enter_screen.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/manage_items.dart';

class PageElement {
  final Widget pageBody;
  final String title;
  final String tag;

  PageElement({required this.pageBody, required this.title, required this.tag});
}

// List of all pages in the admin section
List<PageElement> allPages = [
  PageElement(pageBody: const OrdersAdmin(), title: "", tag: "orders"),
  PageElement(pageBody: const ManageItems(), title: "", tag: "items"),
  PageElement(pageBody: const NotesAdmin(), title: "", tag: "notes"),
  PageElement(pageBody: const Center(child: Icon(Icons.timeline, size: 100)), title: "", tag: "statistics"),
];

class AdminRootPage extends StatefulWidget {
  const AdminRootPage({super.key});

  @override
  State<AdminRootPage> createState() => _AdminRootPageState();
}

class _AdminRootPageState extends State<AdminRootPage> {
  int currentPage = 0;

  final deviceStorage = GetStorage();

  // Function to show the logout confirmation dialog
  Future<void> _showLogoutConfirmation(BuildContext context) async {
    bool? shouldLogout = await Get.dialog(
      AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false); // Close the dialog without logging out
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true); // Confirm logout
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      await AuthenticationRepository.instance.logout();
      // Store admin logout status in GetStorage
      await deviceStorage.write('adminLoggedIn', false);

      Get.offAll(() => const RoleBasedEnterScreen()); // Redirect to the admin login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showLogoutConfirmation(context); // Show logout confirmation on back navigation
        return false; // Prevent back navigation
      },
      child: Scaffold(
        appBar: AdminAppbar(showTitle: true, pageTitle: allPages[currentPage].title, leadingBackArrow: false, viewOption: true),
        body: allPages[currentPage].pageBody,
        bottomNavigationBar: NavigationBar(
          backgroundColor: getColorScheme(context).secondaryContainer,
          indicatorColor: getColorScheme(context).primaryContainer,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.watch_later_outlined), label: "Orders"),
            NavigationDestination(icon: Icon(Icons.playlist_add), label: "Items"),
            NavigationDestination(icon: Icon(Icons.edit_note), label: "Notes"),
            NavigationDestination(icon: Icon(Icons.timeline), label: "Stats"),
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
                    Get.to(()=>const AddNewItem());
                  } else if (currentPage == 2) {
                    Get.to(()=>const NewNote());
                  }
                },
                child:
                    Icon(currentPage == 0 ? Icons.qr_code_outlined : (currentPage == 1 ? Icons.add : Icons.mode_edit_outlined)),
              ),
      ),
    );
  }
}
