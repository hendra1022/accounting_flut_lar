import 'package:akuntansi_flut/services/model/request/supplier.dart';
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

class SupplierCreateController extends BaseController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  Supplier supplier = Supplier();
  int suppId = 0;

  bool isActive = true;

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    if (suppId != 0) {
      await getData();
    }
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
        fillData();
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void fillData() {
    isActive = supplier.active == "1" ? true : false;
    nameTextController.text = supplier.name ?? "";
    addressTextController.text = supplier.address ?? "";
    emailTextController.text = supplier.email ?? "";
    phoneTextController.text = supplier.phone ?? "";
    descTextController.text = supplier.description ?? "";
  }

  void updateIsActive() {
    isActive = !isActive;
    update();
  }

  Future<void> onSave() async {
    if (suppId == 0) {
      await createSupplier();
    } else {
      await updateSupplier();
    }
  }

  Future<void> createSupplier() async {
    try {
      VPopup().loading();

      if (supplier.id == 0) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "All field must be filled!",
          color: VColor.white,
        )));
        Get.back();
      }
      // else if (num.tryParse(phoneTextController.text) == null) {
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      //       content: VText(
      //     "Phone must be only contain number!",
      //     color: VColor.white,
      //   )));
      //   Get.back();
      // }
      else {
        var requestBody = SupplierRequest(
          name: nameTextController.text,
          active: isActive ? "1" : "0",
          address: addressTextController.text,
          description: descTextController.text,
          email: emailTextController.text,
          phone: phoneTextController.text,
        );
        var response = await SupplierRepo().createData(requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toSupplierPage();
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

  Future<void> updateSupplier() async {
    try {
      VPopup().loading();

      if (supplier.id == 0) {
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
        var requestBody = SupplierRequest(
          name: nameTextController.text,
          active: isActive ? "1" : "0",
          address: addressTextController.text,
          description: descTextController.text,
          email: emailTextController.text,
          phone: phoneTextController.text,
        );
        var response = await SupplierRepo().updateData(suppId, requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toSupplierPage();
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
