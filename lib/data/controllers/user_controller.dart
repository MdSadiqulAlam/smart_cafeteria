import 'package:get/get.dart';
import 'package:smart_cafeteria/data/repositories/user/user_repository.dart';

import '../../model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///fetch user record
  Future<void> fetchUserRecord() async {
    try {
      // profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
    // finally {
    //   profileLoading.value = false;
    // }
  }
}
