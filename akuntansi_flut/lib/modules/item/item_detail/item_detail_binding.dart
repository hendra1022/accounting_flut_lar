import 'package:get/get.dart';

import 'item_detail_controller.dart';

class ItemDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemDetailController>(() => ItemDetailController());
  }
}
