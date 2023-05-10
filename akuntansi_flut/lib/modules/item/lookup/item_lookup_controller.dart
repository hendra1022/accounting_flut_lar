import 'package:akuntansi_flut/services/model/item.dart';
import 'package:akuntansi_flut/services/repository/item_repo.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';

class ItemLookUpController extends BaseController {
  bool isActive = true;

  List<Item> itemList = List<Item>.empty(growable: true);

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

  @override
  Future<void> onInit() async {
    isLoading = true;
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
      var response = await ItemRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        itemList = response.data?.itemList ?? [];
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
      var response = await ItemRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        itemList = response.data?.itemList ?? [];
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
