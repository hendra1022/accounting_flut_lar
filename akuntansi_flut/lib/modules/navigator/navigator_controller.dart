import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';

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
}
