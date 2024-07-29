import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/homepage/components/carousel_slider.dart';

import 'components/category_listview.dart';
import 'components/homepage_heading.dart';
import 'components/item_display_gridview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.fromLTRB(10, 3, 10, 2),
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 2),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// food category
          const HomepageHeading(heading: 'Food Categories'),
          // Padding(
          //   padding: const EdgeInsets.only(left: 2),
          //   child: Text(
          //     "Food Categories",
          //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //           color: Theme.of(context).colorScheme.onSurfaceVariant,
          //         ),
          //   ),
          // ),
          const SizedBox(height: 2),
          CategoryList(),

          /// carousel slider
          const SizedBox(height: 7),
          const Row(
            children: [
              HomepageHeading(heading: 'Ready To GO!'),
              SizedBox(width: 3),
              SizedBox(
                  height: 19, width: 19, child: Image(image: AssetImage("assets/categorical_image/fire.gif"), fit: BoxFit.cover)),
            ],
          ),
          const SizedBox(height: 7),
          const CarouselWithIndicator(),

          /// item display
          const SizedBox(height: 12),
          const HomepageHeading(heading: 'Only For You'),
          // Padding(
          //   padding: const EdgeInsets.only(left: 2),
          //   child: Text(
          //     "Discover and Get Great Food",
          //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: Theme.of(context).colorScheme.onSurfaceVariant),
          //   ),
          // ),
          const SizedBox(height: 7),
          const ItemDisplayGridView(),
        ],
      ),
    );
  }
}
