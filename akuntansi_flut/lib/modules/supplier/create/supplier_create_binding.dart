import 'package:get/get.dart';

import 'supplier_create_controller.dart';

class SupplierCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierCreateController>(() => SupplierCreateController());
  }
}
