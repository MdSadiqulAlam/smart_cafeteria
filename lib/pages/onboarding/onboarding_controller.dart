import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_cafeteria/pages/role_based_enter_screen.dart';

import '../../data/repositories/authentication/authentication_repository.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// update current screen
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// jump to specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// update current index and  jump to next page
  void nextPage() {
    if (currentPageIndex.value == 1) {
      /// show on boarding single time
      // final storage = GetStorage();
      // storage.write('isFirstTime', false);
      ///  write is first time false
      Get.find<AuthenticationRepository>().deviceStorage.write('isFirstTime', false);
      Get.to(()=>const RoleBasedEnterScreen());
    } else {
      currentPageIndex.value++;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  /// update current screen and jup to the last page
  void skipPage() {
    // currentPageIndex.value = 1;
    // pageController.jumpTo(1);
    /// todo : write is first time false
    // Get.find<AuthenticationRepository>().deviceStorage.write('isFirstTime', false);
    Get.to(()=>const RoleBasedEnterScreen());
  }
}
