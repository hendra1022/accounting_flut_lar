import 'package:flutter/material.dart';

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

  int selectedPage = 0;

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
        return const DashboardPage();
      case 1:
        return const ItemPage();
      case 2:
        return const ItemCategoryPage();
      case 3:
        return const SupplierPage();
      case 4:
        return const CustomerPage();
      default:
        return const DashboardPage();
    }
  }
}
