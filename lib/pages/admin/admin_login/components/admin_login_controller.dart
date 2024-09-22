import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../components/loading_widgets.dart';
import '../../../../utilities/network_manager.dart';
import '../../admin_root_page.dart';

class AdminLoginController extends GetxController {
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final deviceStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Check if email exists in AdminMail collection
  Future<bool> isAdminEmail(String email) async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('AdminMail').doc(email.trim()).get();

      return snapshot.exists;
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: e.toString());
      return false;
    }
  }

  /// Admin Login
  Future<void> emailAndPasswordAdminSignIn() async {
    try {
      MyLoadingWidgets.loadingDialogue();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Get.back();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      // Check if the email is an admin email
      final isAdmin = await isAdminEmail(email.text.trim());
      if (!isAdmin) {
        Get.back();
        MyLoadingWidgets.errorSnackBar(title: 'Error', message: 'This email is not authorized for admin access');
        return;
      }

      // Login user using Email & Password Authentication
      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Set storage value to true on successful admin login
      await deviceStorage.write('adminLoggedIn', true);

      Get.back();
      // Redirect to AdminRootPage if the login is successful
      Get.to(() => const AdminRootPage());
      MyLoadingWidgets.successSnackBar(title: 'Success', message: 'Logged in successfully');
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
