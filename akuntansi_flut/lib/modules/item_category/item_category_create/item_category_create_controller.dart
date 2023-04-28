import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/model/request/item_category.dart';
import 'package:akuntansi_flut/services/repository/item_category_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';

class ItemCategoryCreateController extends BaseController {
  TextEditingController nameTextController = TextEditingController();

  bool isActive = true;

  int itemCatId = 0;
  ItemCategory itemCategory = ItemCategory();

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    if (itemCatId != 0) {
      await getData();
    }
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsItemCatId] != null) {
      itemCatId = argumentData[PrefConst.keyArgsItemCatId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await ItemCategoryRepo().getDataById(itemCatId);
      if (response.code == 200) {
        itemCategory = response.data ?? ItemCategory();
        isActive = itemCategory.active == "1" ? true : false;
        nameTextController.text = itemCategory.name ?? "";
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
    if (itemCatId == 0) {
      await createCT();
    } else {
      await updateCT();
    }
  }

  Future<void> createCT() async {
    try {
      VPopup().loading();
      var requestBody = ItemCategoryRequest(name: nameTextController.text, active: isActive ? "1" : "0");
      var response = await ItemCategoryRepo().createData(requestBody);
      if (response == "Success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Success",
          color: VColor.white,
        )));
        Get.back();
        VNavigation().toItemCategoryPage();
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
      var requestBody = ItemCategoryRequest(name: nameTextController.text, active: isActive ? "1" : "0");
      var response = await ItemCategoryRepo().updateData(itemCatId, requestBody);
      if (response == "Success") {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "Success",
          color: VColor.white,
        )));
        Get.back();
        VNavigation().toItemCategoryPage();
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
