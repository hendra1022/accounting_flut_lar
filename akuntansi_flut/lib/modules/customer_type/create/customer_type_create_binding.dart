import 'package:get/get.dart';

import 'customer_type_create_controller.dart';

class CustomerTypeCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerTypeCreateController>(() => CustomerTypeCreateController());
  }
}
