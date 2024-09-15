import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import 'package:smart_cafeteria/pages/admin/add_new_item/components/add_item_form.dart';

class AddNewItem extends StatelessWidget {
  const AddNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AdminAppbar(showTitle: true, pageTitle: 'Add New Item', titlePadding: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: ClampingScrollPhysics(),
        child: AddItemForm(),
      ),
    );
  }
}
