import 'package:get/get.dart';

import 'customer_type_lookup_controller.dart';

class CustomerTypeLookUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerTypeLookUpController>(() => CustomerTypeLookUpController());
  }
}
