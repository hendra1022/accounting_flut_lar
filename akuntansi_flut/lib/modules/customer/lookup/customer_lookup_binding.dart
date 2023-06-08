import 'package:get/get.dart';

import 'customer_lookup_controller.dart';

class CustomerLookUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerLookUpController>(() => CustomerLookUpController());
  }
}
