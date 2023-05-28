import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/model/request/item_category.dart';
import 'package:akuntansi_flut/services/repository/item_category_repo.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';
import '../../../utils/widgets/v_popup.dart';

class ItemCategoryLookUpController extends BaseController {
  bool isActive = true;

  List<ItemCategory> itemCategoryList = List<ItemCategory>.empty(growable: true);

  // filter by status
  String selectedFilterStatus = 'Active';
  final List<String> filterStatusItems = [
    'All',
    'Active',
    'Non-Active',
  ];

  // filter by name
  String selectedFilterBy = 'Name';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Name',
    'Code',
  ];

  // create item category
  final TextEditingController itemCategoryController = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoading = true;
    update();
    itemCategoryController.text = "";
    await getData();
    isLoading = false;
    update();

    super.onInit();
  }

  Future<void> search() async {
    isLoading = true;
    update();
    String active = "1";

    if (selectedFilterStatus == "Active") {
      active = "1";
    } else if (selectedFilterStatus == "Non-Active") {
      active = "0";
    } else {
      active = "";
    }

    try {
      var response = await ItemCategoryRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        itemCategoryList = response.data?.itemCategoryList ?? [];
      }
    } catch (e) {
      print("error : $e");
    }
    isLoading = false;
    update();
  }

  Future<void> getData() async {
    String active = "1";

    if (selectedFilterStatus == "Active") {
      active = "1";
    } else if (selectedFilterStatus == "Non-Active") {
      active = "0";
    } else {
      active = "";
    }

    try {
      var response = await ItemCategoryRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        itemCategoryList = response.data?.itemCategoryList ?? [];
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> createSupplier() async {
    try {
      var requestBody = ItemCategoryRequest(name: itemCategoryController.text, active: "1");
      var response = await ItemCategoryRepo().createData(requestBody);
      if (response == "Success") {
        onInit();
      } else {
        VPopup().alertText("Error", response);
      }
    } catch (e) {
      print("Error create supplier : $e");
    }
  }
}
