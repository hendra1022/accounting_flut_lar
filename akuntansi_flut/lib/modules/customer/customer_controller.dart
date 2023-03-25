import 'package:akuntansi_flut/modules/customer/component/table_data_source.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';
import '../../services/model/item_model.dart';

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

  @override
  Future<void> onInit() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }
}
