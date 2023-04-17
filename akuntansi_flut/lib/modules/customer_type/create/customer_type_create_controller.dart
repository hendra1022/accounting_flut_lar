import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/services/model/request/customer_type.dart';
import 'package:akuntansi_flut/services/repository/customer_type_repo.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../utils/widgets/v_widgets.dart';

class CustomerTypeCreateController extends BaseController {
  TextEditingController nameTextController = TextEditingController();

  bool isActive = true;

  void updateIsActive() {
    isActive = !isActive;
    update();
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
}
