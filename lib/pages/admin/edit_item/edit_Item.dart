import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/admin_appbar.dart';
import 'package:smart_cafeteria/pages/admin/edit_item/components/edit_item_form.dart';
import 'package:smart_cafeteria/model/item_model.dart';

class EditItem extends StatelessWidget {
  const EditItem({super.key, required this.item_});

  final ItemModel item_;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppbar(showTitle: true, pageTitle: 'Update This Item', titlePadding: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: const ClampingScrollPhysics(),
        child: EditItemForm(item: item_),
      ),
    );
  }
}
