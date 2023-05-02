import 'package:get/get.dart';

import 'item_category_lookup_controller.dart';

class ItemCategoryLookUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCategoryLookUpController>(() => ItemCategoryLookUpController());
  }
}
