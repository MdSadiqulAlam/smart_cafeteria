import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_controller.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';

class EditItemController extends GetxController {
  static EditItemController get instance => Get.find();

  ///variables
  final itemName = TextEditingController();
  final price = TextEditingController();
  final kcal = TextEditingController();
  final quantity = TextEditingController();
  final description = TextEditingController();
  final itemDetail = TextEditingController();

  /// categories
  ///this list is in the category model: List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];
  final selectedCategories = <String>[].obs; // List to store multiple selected categories

  /// global key
  GlobalKey<FormState> editItemFormKey = GlobalKey<FormState>();

  ///  Image Picker
  var selectedImagePath = ''.obs;
  XFile? image;

  late ItemModel currentItem;

  /// Initialize the controller with the existing item data
  void initializeItemData(ItemModel item) {
    currentItem = item;
    itemName.text = item.name;
    price.text = item.price.toString();
    kcal.text = item.kcal.toString();
    quantity.text = item.quantity.toString();
    itemDetail.text = item.itemDetail;
    description.text = item.description;
    selectedCategories.assignAll(item.category);
    selectedImagePath.value = item.imagePath;
  }

  /// Pick a new image for the item
  Future<void> pickItemImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image!.path;
    } else {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'No image selected');
    }
  }

  /// --- update item
  Future<void> updateItem(BuildContext context) async {
    try {
      /// start loading
      MyLoadingWidgets.loadingDialogue();

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.back();
        MyLoadingWidgets.noInternetConnectionDialogue();
        return;
      }

      /// Form Validation
      if (!editItemFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      /// Handle image update if a new image is selected
      final itemRepository = ItemData();
      String imageUrl = currentItem.imagePath;
      if (image != null) {
        imageUrl = await itemRepository.uploadImage('ItemImages/', image!);
      }

      /// Create an updated item
      final updatedItem = ItemModel(
        id: currentItem.id,
        name: itemName.text.trim(),
        imagePath: imageUrl,
        price: num.parse(price.text.trim()),
        kcal: num.parse(kcal.text.trim()),
        category: selectedCategories,
        quantity: int.parse(quantity.text.trim()),
        itemDetail: itemDetail.text.trim(),
        description: description.text.trim(),
        itemSold: currentItem.itemSold,

        /// Keep original data
        ratingCount: currentItem.ratingCount,
        ratingMap: currentItem.ratingMap,
        createDate: currentItem.createDate,
      );

      /// Update the item in Firestore
      await itemRepository.updateInFirestore(updatedItem);

      ///reload the all items screen
      await ManageItemsController.instance.fetchItemsFromFirestore();
      Get.back(); // Close the loading dialog
      Get.back(); // got to all items screen
      MyLoadingWidgets.successSnackBar(title: 'Success!', message: 'Item updated successfully');
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}


// String id;
// String name; // admin can set
// String imagePath; // admin can set
// num price; // admin can set
// num kcal; // admin can set
// List<String> category; // admin can set
// int quantity; // admin can set
// String itemDetail; // admin can set
// String description; // admin can set
// int itemSold;
// double ratingCount;
// Map<double, double> ratingMap;
// DateTime createDate;