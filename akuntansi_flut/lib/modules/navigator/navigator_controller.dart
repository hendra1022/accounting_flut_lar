import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/base_controller.dart';
import '../customer/customer.dart';
import '../dashboard/dashboard.dart';
import '../item/item.dart';
import '../item_category/item_category.dart';
import '../supplier/supplier.dart';

class NavigatorController extends BaseController {
  PageController pageController = PageController();

  bool showDropdownMaster = false;
  bool showDropdownTransaction = false;

  int selectedPage = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initLocalData();
  }

  Future<void> initLocalData() async {}

  void updateDropdownMaster() {
    showDropdownMaster = !showDropdownMaster;
    update();
  }

  void updateDropdownTransaction() {
    showDropdownTransaction = !showDropdownTransaction;
    update();
  }

  void updateSelectedPage(int target) {
    selectedPage = target;
    showDropdownMaster = false;
    showDropdownTransaction = false;
    update();
  }

  Widget selectedPageWidget() {
    switch (selectedPage) {
      case 0:
        Get.lazyPut<DashboardController>(() => DashboardController());
        return const DashboardPage();
      case 1:
        Get.lazyPut<ItemController>(() => ItemController());
        return const ItemPage();
      case 2:
        Get.lazyPut<ItemCategoryController>(() => ItemCategoryController());
        return const ItemCategoryPage();
      case 3:
        Get.lazyPut<SupplierController>(() => SupplierController());
        return const SupplierPage();
      case 4:
        Get.lazyPut<CustomerController>(() => CustomerController());
        return const CustomerPage();
      default:
        return const DashboardPage();
    }
  }
}
