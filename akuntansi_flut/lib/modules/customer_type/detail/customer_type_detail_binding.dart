import 'package:get/get.dart';

import 'customer_type_detail_controller.dart';

class CustomerTypeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerTypeDetailController>(() => CustomerTypeDetailController());
  }
}
