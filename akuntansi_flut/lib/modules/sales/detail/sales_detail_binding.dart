import 'package:get/get.dart';

import 'sales_detail_controller.dart';

class SalesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesDetailController>(() => SalesDetailController());
  }
}
