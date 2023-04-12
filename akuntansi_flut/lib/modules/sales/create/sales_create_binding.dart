import 'package:get/get.dart';

import 'sales_create_controller.dart';

class SalesCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesCreateController>(() => SalesCreateController());
  }
}
