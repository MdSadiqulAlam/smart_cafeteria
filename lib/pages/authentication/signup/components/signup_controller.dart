import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/data/repositories/user/user_repository.dart';
import 'package:smart_cafeteria/model/user_model.dart';
import 'package:smart_cafeteria/pages/authentication/signup/components/email_verification_bottom_sheet.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  // final username = TextEditingController();
  final createPassword = TextEditingController();
  // final confirmPassword = TextEditingController();

  /// global key
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- signup
  Future<void> signup(BuildContext context) async {
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
      if (!signupFormKey.currentState!.validate()) {
        Get.back();
        return;
      }

      /// register user in firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), createPassword.text.trim());

      /// save authentication user data in the Firebase fire-store
      final UserModel newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        // username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// move to verify email
      Get.back();
      emailVerificationBottomSheet(context: Get.overlayContext!, email_: newUser.email.trim());
    } catch (e) {
      Get.back();
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
