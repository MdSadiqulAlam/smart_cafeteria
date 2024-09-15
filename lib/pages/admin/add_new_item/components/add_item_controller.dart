import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';

import '../../../../utilities/network_manager.dart';

class AddItemController extends GetxController {
  static AddItemController get instance => Get.find();

  ///variables
  final itemName = TextEditingController();
  final price = TextEditingController();
  final kcal = TextEditingController();
  final quantity = TextEditingController();
  final selectedCategory = RxnString(null);
  final description = TextEditingController();
  final itemDetail = TextEditingController();

  /// categories
  List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];

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

      // /// register user in firebase
      // final userCredential =
      // await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), createPassword.text.trim());
      //
      // /// store image
      // final userRepository = Get.put(UserRepository());
      // final imageUrl = await userRepository.uploadImage('UserDp/', image!);
      //
      // /// save authentication user data in the Firebase fire-store
      // final UserModel newUser = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: firstName.text.trim(),
      //   lastName: lastName.text.trim(),
      //   // username: username.text.trim(),
      //   email: email.text.trim(),
      //   phoneNumber: phoneNumber.text.trim(),
      //   profilePicture: imageUrl,
      // );
      // FirebaseAuth.instance.currentUser?.updateProfile(photoURL: imageUrl, displayName: newUser.fullName);
      // await userRepository.saveUserRecord(newUser);
      //
      // /// move to verify email
      // Get.back();
      // emailVerificationBottomSheet(context: Get.overlayContext!, email_: newUser.email.trim());
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}
