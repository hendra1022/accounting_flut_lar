import 'package:get/get.dart';

import 'a_controller.dart';

class ABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AController>(() => AController());
  }
}
