import 'package:akuntansi_flut/modules/sales/component/table_data_source.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/base_controller.dart';
import '../../services/model/sales_header.dart';

class SalesController extends BaseController {
  final SalesDataTableSource dataSource = SalesDataTableSource();

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

  // table
  int page = 1;
  int rowPerPage = 10;

  @override
  Future<void> onInit() async {
    isLoading = true;
    final now = DateTime.now();
    startDate = DateTime(now.year, now.month, 1);

    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
    endDateView = DateFormat("dd-MM-yyyy").format(endDate);
    await changePage(page, true);
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(SalesHeader user) getField, int colIndex, bool ascending) {
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

  Future<void> changePage(int page, bool reset, {int rowPerPageTemp = 0}) async {
    rowPerPage = rowPerPageTemp <= 0 ? rowPerPage : rowPerPageTemp;
    isLoading = true;
    update();
    this.page = page;

    String sDate = DateFormat("yyyy-MM-dd").format(startDate);
    String eDate = DateFormat("yyyy-MM-dd").format(endDate);

    await dataSource.getData(page, reset, sDate, eDate, rowPerPage: rowPerPage);
    isLoading = false;
    update();
  }
}
