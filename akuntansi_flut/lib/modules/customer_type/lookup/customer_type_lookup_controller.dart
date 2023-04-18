import 'package:akuntansi_flut/services/model/customer_type.dart';
import 'package:akuntansi_flut/services/repository/customer_type_repo.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';

class CustomerTypeLookUpController extends BaseController {
  bool isActive = true;

  List<CustomerType> customerTypeList = List<CustomerType>.empty(growable: true);

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
      var response = await CustomerTypeRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        customerTypeList = response.data?.customerTypeList ?? [];
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
      var response = await CustomerTypeRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        customerTypeList = response.data?.customerTypeList ?? [];
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
