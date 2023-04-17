import 'package:get/get.dart';

import 'customer_type_controller.dart';

class CustomerTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerTypeController>(() => CustomerTypeController());
  }
}
