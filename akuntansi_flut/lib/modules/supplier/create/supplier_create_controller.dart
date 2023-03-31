import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';

class SupplierCreateController extends BaseController {
  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  bool isActive = true;

  void updateIsActive() {
    isActive = !isActive;
    update();
  }

  Future<void> onSave() async {
    Get.back();
  }
}
