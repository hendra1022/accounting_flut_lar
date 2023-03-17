import 'package:get/get.dart';

import 'item_category_detail_controller.dart';

class ItemCategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCategoryDetailController>(() => ItemCategoryDetailController());
  }
}
