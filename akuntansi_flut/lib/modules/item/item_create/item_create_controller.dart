import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';

class ItemCreateController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController hppTextController = TextEditingController();
  TextEditingController categoryTextController = TextEditingController();
  TextEditingController customerTaxTextController = TextEditingController();
  TextEditingController supplierTaxTextController = TextEditingController();

  bool isHaveVariant = false;
  bool isCategoryPicked = false;
  bool isCustoemrTaxPicked = false;
  bool isSupplierTaxPicked = false;
  bool isActive = true;

  Future<void> onSave() async {
    Get.back();
  }

  void updateIsHaveVariant() {
    isHaveVariant = !isHaveVariant;
    update();
  }

  void updateIsActive() {
    isActive = !isActive;
    update();
  }
}
