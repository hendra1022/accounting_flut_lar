import 'package:get/get.dart';

import 'item_lookup_controller.dart';

class ItemLookUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemLookUpController>(() => ItemLookUpController());
  }
}
