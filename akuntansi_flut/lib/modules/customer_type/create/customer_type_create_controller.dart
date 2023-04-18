import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/services/model/request/customer_type.dart';
import 'package:akuntansi_flut/services/repository/customer_type_repo.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/customer_type.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';

class CustomerTypeCreateController extends BaseController {
  TextEditingController nameTextController = TextEditingController();

  bool isActive = true;

  int custTypeId = 0;
  CustomerType customerType = CustomerType();

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    if (custTypeId != 0) {
      await getData();
    }
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
        nameTextController.text = customerType.name ?? "";
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void updateIsActive() {
    isActive = !isActive;
    update();
  }

  Future<void> onSave() async {
    if (custTypeId == 0) {
      await createCT();
    } else {
      await updateCT();
    }
  }

  Future<void> createCT() async {
    try {
      VPopup().loading();
      var requestBody = CustomerTypeRequest(name: nameTextController.text, active: isActive ? "1" : "0");
      var response = await CustomerTypeRepo().createData(requestBody);
      if (response == "Success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Success",
          color: VColor.white,
        )));
        Get.back();
        VNavigation().toCustomerTypePage();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: VText(
          response,
          color: VColor.white,
        )));
        Get.back();
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }

  Future<void> updateCT() async {
    try {
      VPopup().loading();
      var requestBody = CustomerTypeRequest(name: nameTextController.text, active: isActive ? "1" : "0");
      var response = await CustomerTypeRepo().updateData(custTypeId, requestBody);
      if (response == "Success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Success",
          color: VColor.white,
        )));
        Get.back();
        VNavigation().toCustomerTypePage();
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: VText(
          response,
          color: VColor.white,
        )));
        Get.back();
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }
}
