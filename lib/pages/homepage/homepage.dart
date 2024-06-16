import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/home_appbar.dart';
import 'components/category_listview.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final double card_height = Size.fromHeight(kToolbarHeight).height * 1.8;

    return Scaffold(
      // drawer: AppbarMenu(),
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 3, 10, 2),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "Delicious Food",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                "Discover and Get Great Food",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ),
            SizedBox(height: 10),
            CategoryList(card_height: card_height)
          ],
        ),
      ),
    );
  }
}

