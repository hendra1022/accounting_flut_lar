import 'package:get/get.dart';

import 'purchase_detail_controller.dart';

class PurchaseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseDetailController>(() => PurchaseDetailController());
  }
}
