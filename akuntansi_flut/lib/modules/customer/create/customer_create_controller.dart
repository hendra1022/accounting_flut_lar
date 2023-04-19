
import 'package:akuntansi_flut/services/model/customer_type.dart';
import 'package:akuntansi_flut/services/model/request/customer.dart';
import 'package:akuntansi_flut/services/repository/customer_repo.dart';
import 'package:akuntansi_flut/services/repository/customer_type_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/customer.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';

class CustomerCreateController extends BaseController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();
  TextEditingController custTypeNameController = TextEditingController();

  Customer customer = Customer();
  int cusId = 0;

  CustomerType customerType = CustomerType();

  bool isActive = true;

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    if (cusId != 0) {
      await getData();
    }
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsCusId] != null) {
      cusId = argumentData[PrefConst.keyArgsCusId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await CustomerRepo().getDataById(cusId);
      if (response.code == 200) {
        customer = response.data ?? Customer();

        var responseCustomerType = await CustomerTypeRepo().getDataById(customer.ctId!);
        if (responseCustomerType.code == 200) {
          customerType = responseCustomerType.data ?? CustomerType();
          fillData();
          update();
        }
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void fillData() {
    isActive = customer.active == "1" ? true : false;
    nameTextController.text = customer.name ?? "";
    addressTextController.text = customer.address ?? "";
    emailTextController.text = customer.email ?? "";
    phoneTextController.text = customer.phone ?? "";
    descTextController.text = customer.description ?? "";
    custTypeNameController.text = customerType.name ?? "";
  }

  void updateIsActive() {
    isActive = !isActive;
    update();
  }

  Future<void> onSave() async {
    if (cusId == 0) {
      await createCustomer();
    } else {
      await updateCustomer();
    }
  }

  Future<void> createCustomer() async {
    try {
      VPopup().loading();

      if (customer.id == 0) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "All field must be filled!",
          color: VColor.white,
        )));
        Get.back();
      } else if (num.tryParse(phoneTextController.text) == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Phone must be only contain number!",
          color: VColor.white,
        )));
        Get.back();
      } else {
        var requestBody = CustomerRequest(
            name: nameTextController.text,
            active: isActive ? "1" : "0",
            address: addressTextController.text,
            description: descTextController.text,
            email: emailTextController.text,
            phone: phoneTextController.text,
            ctId: customerType.id.toString());
        var response = await CustomerRepo().createData(requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toCustomerPage();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: VText(
            response,
            color: VColor.white,
          )));
          Get.back();
        }
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }

  Future<void> updateCustomer() async {
    try {
      VPopup().loading();

      if (customer.id == 0) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "All field must be filled!",
          color: VColor.white,
        )));
        Get.back();
      } else if (num.tryParse(phoneTextController.text) == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Phone must be only contain number!",
          color: VColor.white,
        )));
        Get.back();
      } else {
        var requestBody = CustomerRequest(
            name: nameTextController.text,
            active: isActive ? "1" : "0",
            address: addressTextController.text,
            description: descTextController.text,
            email: emailTextController.text,
            phone: phoneTextController.text,
            ctId: customerType.id.toString());
        var response = await CustomerRepo().updateData(cusId, requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toCustomerPage();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: VText(
            response,
            color: VColor.white,
          )));
          Get.back();
        }
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }
}
