import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/appbar.dart';
import 'package:smart_cafeteria/pages/homepage/components/category/categorical_item_display_gridview.dart';

class CategoricalItemDisplay extends StatelessWidget {
  const CategoricalItemDisplay({super.key, required this.name, required this.tag});

  final String name;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(showTitle: true, pageTitle: name.toCapitalCase()),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
        physics: const BouncingScrollPhysics(),
        // child: ItemDisplayGridView(filter: true, filterCategory: tag),
        child: CategoricalItemDisplayGridview(categoryTag: tag),
      ),
    );
  }
}
