import 'package:flutter/material.dart';
import 'package:smart_cafeteria/pages/homepage/components/carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/homepage/components/category/category_listview.dart';
import 'package:smart_cafeteria/pages/homepage/components/homepage_heading.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_controller.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display/item_display_gridview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// put display controller
    Get.put(ItemDisplayController());

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

          /// item display heading
          const SizedBox(height: 12),
          const HomepageHeading(heading: 'Only For You'),

          /// item display gird view
          const SizedBox(height: 7),
          const ItemDisplayGridView(),
        ],
      ),
    );
  }
}
