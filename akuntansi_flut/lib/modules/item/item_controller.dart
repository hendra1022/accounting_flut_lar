import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/repository/item_category_repo.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';
import '../../services/model/item.dart';
import 'component/table_data_source.dart';

class ItemController extends BaseController {
  final ItemDataTableSource dataSource = ItemDataTableSource();

  // item category
  ItemCategory? selectedCategory;
  TextEditingController itemCategorySearchController = TextEditingController();
  List<ItemCategory> itemCategoryItems = List<ItemCategory>.empty(growable: true);

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

  // table
  int page = 1;
  int rowPerPage = 10;

  @override
  Future<void> onInit() async {
    isLoading = true;
    await dataSource.getData(page, rowPerPage: rowPerPage, true);
    await getItemCategoryList();
    isLoading = false;
    update();

    super.onInit();
  }

  Future<void> getItemCategoryList() async {
    try {
      var response = await ItemCategoryRepo().getAllData();
      if (response.code == 200) {
        itemCategoryItems.add(ItemCategory(id: 0, name: "All Category", active: "1"));
        itemCategoryItems.addAll(response.data?.itemCategoryList ?? []);
      }
    } catch (e) {
      print("error get item category list : $e");
    }
  }

  void sortData<T>(Comparable<T> Function(Item itemCategory) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> changePage(int page, bool reset, {int rowPerPageTemp = 0, int itemCatId = 0}) async {
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
