import 'package:get/get.dart';
import 'package:smart_cafeteria/data/repositories/authentication/authentication_repository.dart';

class RoleSelectController extends GetxController {
  bool userRole = true;

  Future<void> roleValidate() async {
    if (userRole == true) {
      AuthenticationRepository.instance.screenRedirect();
    } else {
      AuthenticationRepository.instance.adminScreenRedirect();
    }
  }
}
