import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/pages/homepage/components/item_display_controller.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';
import 'package:smart_cafeteria/pages/order_screens/orders/components/order_controller.dart';

class LoginController extends GetxController {
  /// Variables
  // final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // final userController = Get.put(UserController());

  ///Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      // TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);
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

      // // Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      // Check if the email exists in 'AdminMail' collection
      final isAdmin = await checkIfAdminEmail(email.text.trim());
      if (isAdmin) {
        Get.back();
        MyLoadingWidgets.errorSnackBar(title: 'Access Denied', message: 'This email is not registered as an user.');
        return;
      }

      /// Login user using EMail & Password Authentication
      // final userCredentials =
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      if (kDebugMode) {
        print('Printing User: ${FirebaseAuth.instance.currentUser}');
      }

      // await ItemDisplayController.instance.fetchFavoriteItems();
      // await OrderController.instance.fetchUserOrders();

      /// Remove Loader
      Get.back();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Check if email is in AdminMail collection
  Future<bool> checkIfAdminEmail(String email) async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('AdminMail').doc(email).get();
      return snapshot.exists;
    } catch (e) {
      throw "Error checking admin email: $e";
    }
  }
}
