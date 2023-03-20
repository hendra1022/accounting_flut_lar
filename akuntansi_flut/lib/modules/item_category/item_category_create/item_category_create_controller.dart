import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';

class ItemCategoryCreateController extends BaseController {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isActive = false;

  void updateActive() {
    isActive = !isActive;
    update();
  }

  Future<void> createItemCategory() async {
    Get.back();
  }
}
