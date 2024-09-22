import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/pages/admin/edit_item/components/edit_item_form.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/model/item_data.dart';

import '../manage_items/components/manage_items_controller.dart';

class EditItem extends StatelessWidget {
  const EditItem({super.key, required this.item_});

  final ItemModel item_;

  // Function to show delete confirmation dialog
  Future<void> _showDeleteConfirmation(BuildContext context) async {
    bool? shouldDelete = await Get.dialog(
      AlertDialog(
        title: const Text('Delete Confirmation'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false); // Close dialog without deleting
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true); // Confirm delete
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      try {
        MyLoadingWidgets.loadingDialogue();
        // Reference to ItemData class for backend operations
        final ItemData itemData = ItemData();
        // Delete the item using deleteFromFirestore method from ItemData
        await itemData.deleteFromFirestore(item_.id);

        ///reload the all items screen
        await ManageItemsController.instance.fetchItemsFromFirestore();
        Get.back();
        Get.back(); // Go back to the previous screen after deletion
        MyLoadingWidgets.successSnackBar(title: 'Success', message: 'Item deleted successfully');
      } catch (e) {
        Get.snackbar('Error', 'Failed to delete item: $e', snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: getColorScheme(context).secondaryContainer,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text('Update This Item', style: TextStyle(fontSize: 24, color: getColorScheme(context).primary)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline_rounded, color: getColorScheme(context).error),
            onPressed: () {
              _showDeleteConfirmation(context);
            },
            tooltip: 'Delete Item',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        physics: const ClampingScrollPhysics(),
        child: EditItemForm(item: item_),
      ),
    );
  }
}
