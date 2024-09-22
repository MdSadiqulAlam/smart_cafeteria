import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';

import '../../../components/loading_widgets.dart';
import '../../../model/item_model.dart';

class RoleSelectController extends GetxController {
  static RoleSelectController get instance => Get.find();

  final deviceStorage = GetStorage();
  bool userRole = true;

  @override
  void onReady() {
    super.onReady();
    makeStorage();
  }

  Future<void> makeStorage() async {
    await deviceStorage.writeIfNull('adminLoggedIn', false);
  }

  Future<void> roleValidate() async {
    bool isAdminLoggedIn = deviceStorage.read<bool>('adminLoggedIn') ?? false;

    /// todo: to upload while role select, execute this
    // final uploader = DemoDataUploader();
    // uploader.uploadAllItems();

    if (userRole == true) {
      if (isAdminLoggedIn) {
        _showLogoutConfirmationDialog();
      } else {
        AuthenticationRepository.instance.screenRedirect();
      }
    } else {
      AuthenticationRepository.instance.adminScreenRedirect();
    }
  }

  void _showLogoutConfirmationDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('You are currently logged in as an admin. Do you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Get.back(); // Close the dialog
              MyLoadingWidgets.loadingDialogue();
              // Perform logout action
              await AuthenticationRepository.instance.logout(); // Ensure you have this method in your AuthenticationRepository
              deviceStorage.write('adminLoggedIn', false);
              Get.back(); // end loading
              AuthenticationRepository.instance.screenRedirect(); // Redirect after logout
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Just close the dialog if 'No' is clicked
            },
            child: const Text('No'),
          ),
        ],
      ),
      barrierDismissible: false, // Prevents dialog from being dismissed by tapping outside
    );
  }
}
