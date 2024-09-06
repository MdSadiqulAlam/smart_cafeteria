import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/components/loading_widgets.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';

import 'package:smart_cafeteria/config/get_config.dart';
import 'package:smart_cafeteria/pages/root_page.dart';
import 'email_verification_bottom_sheet.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      MyLoadingWidgets.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Manually Check if email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.reload();
      if (currentUser.emailVerified) {
        AuthenticationRepository.instance.screenRedirect();
        MyLoadingWidgets.successSnackBar(title: 'Account Created Successfully',message: 'Welcome to SmartCafeteria');
        // Get.snackbar(
        //   'Account Created Successfully',
        //   'Welcome to Smart Cafeteria',
        //   backgroundColor: getColorScheme(Get.overlayContext!).primaryContainer,
        // );
      } else {
        emailVerificationAlert(Get.overlayContext!);
      }
      // Get.off(
      //   () => SuccessScreen(
      //       image: TImages.staticSuccessIllustration,
      //       title: TTexts.yourAccountCreatedSubTitle,
      //       subTitle: TTexts.yourAccountCreatedSubTitle,
      //       onPressed: () => AuthenticationRepository.instance.screenRedirect()),
      // );
    }
  }
}
