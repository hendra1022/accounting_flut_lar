import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/repository/item_category_repo.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item.dart';
import '../../../utils/constants.dart';
import 'component/table_data_source.dart';

class ItemCategoryDetailController extends BaseController {
  final ItemCategoryDetailDataTableSource dataSource = ItemCategoryDetailDataTableSource();

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

  int page = 1;
  int rowPerPage = 10;

  bool isActive = true;

  int itemCatId = 0;
  ItemCategory itemCategory = ItemCategory();

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    await getData();
    await dataSource.getData(page, rowPerPage: rowPerPage, true, itemCatId: itemCatId);
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
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void sortData<T>(Comparable<T> Function(Item itemCategory) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> changePage(int page, bool reset, {int rowPerPageTemp = 0}) async {
    rowPerPage = rowPerPageTemp <= 0 ? rowPerPage : rowPerPageTemp;
    isLoading = true;
    update();
    this.page = page;
    String active = "1";

    if (selectedFilterStatus == "Active") {
      active = "1";
    } else if (selectedFilterStatus == "Non-Active") {
      active = "0";
    } else {
      active = "";
    }
    await dataSource.getData(page, reset, rowPerPage: rowPerPage, search: itemSearchController.text, active: active, itemCatId: itemCatId);
    isLoading = false;
    update();
  }
}
