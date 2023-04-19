import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/customer.dart';
import '../../../services/model/customer_type.dart';
import '../../../services/repository/customer_repo.dart';
import '../../../services/repository/customer_type_repo.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';

class CustomerDetailController extends BaseController {
  bool isActive = true;

  int custId = 0;
  Customer customer = Customer();

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
    if (argumentData[PrefConst.keyArgsCusId] != null) {
      custId = argumentData[PrefConst.keyArgsCusId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await CustomerRepo().getDataById(custId);
      if (response.code == 200) {
        customer = response.data ?? Customer();
        isActive = customer.active == "1" ? true : false;

        var responseCustomerType = await CustomerTypeRepo().getDataById(customer.ctId!);
        if (responseCustomerType.code == 200) {
          customerType = responseCustomerType.data ?? CustomerType();
        }
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> deleteData() async {
    VPopup().loading();
    try {
      var response = await CustomerRepo().deleteData(custId);
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: VText(
        response,
        color: VColor.white,
      )));
      Get.back();

      if (response == "Success") {
        VNavigation().toCustomerPage();
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
