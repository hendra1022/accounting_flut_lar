import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/base_controller.dart';
import '../../services/model/item_model.dart';
import '../customer/component/table_data_source.dart';

class PurchaseController extends BaseController {
  final CustomerDataTableSource dataSource = CustomerDataTableSource();

  // filter by name
  String selectedFilterBy = 'Document No';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Document No',
    'Customer Name',
  ];

  // filter by date
  DateTime startDate = DateTime.now();
  String startDateView = "";
  DateTime endDate = DateTime.now();
  String endDateView = "";

  @override
  Future<void> onInit() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
    endDateView = DateFormat("dd-MM-yyyy").format(endDate);
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  void updateStartDate(DateTime temp) {
    startDate = temp;
    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
    update();
  }

  void updateEndDate(DateTime temp) {
    endDate = temp;
    endDateView = DateFormat("dd-MM-yyyy").format(endDate);
    update();
  }
}
