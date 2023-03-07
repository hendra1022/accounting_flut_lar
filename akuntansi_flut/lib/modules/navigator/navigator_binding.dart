import 'package:get/get.dart';

import '../dashboard/dashboard.dart';
import '../item/item.dart';
import '../item_category/item_category.dart';
import 'navigator_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(() => NavigatorController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ItemController>(() => ItemController());
    Get.lazyPut<ItemCategoryController>(() => ItemCategoryController());
  }
}
