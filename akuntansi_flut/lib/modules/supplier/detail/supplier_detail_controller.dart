import 'package:akuntansi_flut/services/model/supplier.dart';
import 'package:akuntansi_flut/services/repository/supplier_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';

class SupplierDetailController extends BaseController {
  bool isActive = true;

  int suppId = 0;
  Supplier supplier = Supplier();

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    await getData();
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsSupId] != null) {
      suppId = argumentData[PrefConst.keyArgsSupId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await SupplierRepo().getDataById(suppId);
      if (response.code == 200) {
        supplier = response.data ?? Supplier();
        isActive = supplier.active == "1" ? true : false;
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> deleteData() async {
    VPopup().loading();
    try {
      var response = await SupplierRepo().deleteData(suppId);
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: VText(
        response,
        color: VColor.white,
      )));
      Get.back();

      if (response == "Success") {
        VNavigation().toSupplierPage();
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
