import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/homepage_appbar.dart';
import '../../components/appbar_menu.dart';
import '../../components/item_display_gridview/item_display_gridview.dart';
import 'components/category_listview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double card_height =
        const Size.fromHeight(kToolbarHeight).height * 1.8;

    return Scaffold(
      drawer:  AppbarMenu(),
      appBar: const HomeAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 3, 10, 2),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "Delicious Food",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                "Food Categories",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
            const SizedBox(height: 5),
            CategoryList(card_height: card_height),
            const SizedBox(height: 12),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Text(
                    "Available NOW!",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                  ),
                ),
                const SizedBox(width: 10),
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: Image(
                    image: AssetImage("assets/categorical_image/fire.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 2),
            //   child: Text(
            //     "Discover and Get Great Food",
            //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
            //         color: Theme.of(context).colorScheme.onSurfaceVariant),
            //   ),
            // ),
            const SizedBox(height: 10),
            const ItemDisplayGridView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Bari"),
        ],
      ),
    );
  }
}


