import 'package:akuntansi_flut/modules/customer/component/table_data_source.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';
import '../../services/model/customer.dart';

class CustomerController extends BaseController {
  final CustomerDataTableSource dataSource = CustomerDataTableSource();

  // filter by status
  String selectedFilterStatus = 'Active';
  final List<String> filterStatusItems = [
    'All',
    'Active',
    'Non-Active',
  ];

  // filter by name
  String selectedFilterBy = 'Code';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Code',
    'Name',
  ];

  // table
  int page = 1;
  int rowPerPage = 10;

  @override
  Future<void> onInit() async {
    isLoading = true;
    await dataSource.getData(page, rowPerPage: rowPerPage, true);
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(Customer customerType) getField, int colIndex, bool ascending) {
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
    await dataSource.getData(page, reset, rowPerPage: rowPerPage, search: itemSearchController.text, active: active);
    isLoading = false;
    update();
  }
}
