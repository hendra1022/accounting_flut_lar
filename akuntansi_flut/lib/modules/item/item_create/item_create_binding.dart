import 'package:get/get.dart';

import 'item_create_controller.dart';

class ItemCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemCreateController>(() => ItemCreateController());
  }
}
