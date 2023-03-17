import 'package:get/get.dart';

import 'item_category_create_controller.dart';

class ItemCategoryCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCategoryCreateController>(() => ItemCategoryCreateController());
  }
}
