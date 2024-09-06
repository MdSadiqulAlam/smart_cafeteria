import 'package:get/get.dart';
import 'package:smart_cafeteria/utilities/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
