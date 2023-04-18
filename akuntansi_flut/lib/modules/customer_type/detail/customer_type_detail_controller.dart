import 'package:akuntansi_flut/services/model/customer_type.dart';
import 'package:akuntansi_flut/services/repository/customer_type_repo.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:akuntansi_flut/utils/widgets/v_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';

class CustomerTypeDetailController extends BaseController {
  bool isActive = true;

  int custTypeId = 0;
  CustomerType customerType = CustomerType();

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
    if (argumentData[PrefConst.keyArgsCusTypeId] != null) {
      custTypeId = argumentData[PrefConst.keyArgsCusTypeId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await CustomerTypeRepo().getDataById(custTypeId);
      if (response.code == 200) {
        customerType = response.data ?? CustomerType();
        isActive = customerType.active == "1" ? true : false;
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> deleteData() async {
    VPopup().loading();
    try {
      var response = await CustomerTypeRepo().deleteData(custTypeId);
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: VText(
        response,
        color: VColor.white,
      )));
      Get.back();

      if (response == "Success") {
        VNavigation().toCustomerTypePage();
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
