import 'package:get/get.dart';

import 'supplier_lookup_controller.dart';

class SupplierLookUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierLookUpController>(() => SupplierLookUpController());
  }
}
