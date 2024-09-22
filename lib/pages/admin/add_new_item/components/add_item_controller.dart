import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/pages/admin/manage_items/components/manage_items_controller.dart';
import 'package:smart_cafeteria/model/item_data.dart';
import 'package:smart_cafeteria/model/item_model.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';

class AddItemController extends GetxController {
  static AddItemController get instance => Get.find();

  ///variables
  final itemName = TextEditingController();
  final price = TextEditingController();
  final kcal = TextEditingController();
  final quantity = TextEditingController();

  // final selectedCategory = RxnString(null);
  final description = TextEditingController();
  final itemDetail = TextEditingController();

  /// categories
  ///this list is in the category model: List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];
  final selectedCategories = <String>[].obs; // List to store multiple selected categories

  /// global key
  GlobalKey<FormState> addItemFormKey = GlobalKey<FormState>();

  ///  Image Picker
  var selectedImagePath = ''.obs;
  XFile? image;

  Future<void> pickItemImage() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image!.path;
    } else {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'No image selected');
    }
  }

  /// --- create item
  Future<void> createItem(BuildContext context) async {
    try {
      /// start loading
      MyLoadingWidgets.loadingDialogue();
      // MyLoadingWidgets.customToast(message: 'title');

      /// Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.back();
        MyLoadingWidgets.noInternetConnectionDialogue();
        return;
      }

      /// Form Validation
      if (!addItemFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      /// Check if profile image is selected
      if (image == null) {
        Get.back();
        MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'Please select a item image');
        return;
      }

      /// Upload image to Firebase Storage
      final itemRepository = ItemData(); // Ensure ItemData class is properly imported
      final imageUrl = await itemRepository.uploadImage('ItemImages/', image!);

      /// Create a new item
      final newItem = ItemModel(
        id: '',
        // ID will be assigned by Firestore
        name: itemName.text.trim(),
        imagePath: imageUrl,
        price: num.parse(price.text.trim()),
        kcal: num.parse(kcal.text.trim()),
        category: selectedCategories,
        quantity: int.parse(quantity.text.trim()),
        itemDetail: itemDetail.text.trim(),
        description: description.text.trim(),
        itemSold: 0,
        ratingCount: 0.0,
        ratingMap: {},
        createDate: DateTime.now(),
      );

      /// Save item to Firestore
      await itemRepository.saveToFirestore(newItem);

      ///reload the all items screen
      await ManageItemsController.instance.fetchItemsFromFirestore();
      Get.back(); // Close the loading dialog
      Get.back(); // got to all items screen
      MyLoadingWidgets.successSnackBar(title: 'Success!', message: 'Item added successfully');
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
