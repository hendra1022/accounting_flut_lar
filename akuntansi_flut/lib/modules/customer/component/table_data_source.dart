import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/customer.dart';
import '../../../services/model/response/customer_list.dart';
import '../../../services/repository/customer_repo.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';

class CustomerDataTableSource extends DataTableSource {
  CustomerListResponse _data = CustomerListResponse();
  List<Customer> customerList = List<Customer>.empty(growable: true);

  void sort<T>(Comparable<T> Function(Customer customer) getField, bool ascending) {
    customerList.sort((Customer a, Customer b) {
      if (!ascending) {
        final Customer c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  Future<bool> getData(int page, bool reset, {int rowPerPage = 25, String search = "", String active = "1"}) async {
    try {
      if (reset) {
        customerList.clear();
      }
      var response = await CustomerRepo().getAllDataBy(page, rowPerPage: rowPerPage, search: search, active: active);
      if (response.code == 200) {
        _data = response.data ?? CustomerListResponse();
        customerList.addAll(_data.customerList ?? []);
        customerList = customerList.toSet().toList();

        final ids = customerList.map((e) => e.id).toSet();
        customerList.retainWhere((x) => ids.remove(x.id));
      }
    } catch (e) {
      log("error : $e");
    }
    return false;
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.total ?? 0;
  @override
  int get selectedRowCount => 0;

  int get rowPerPage => _data.perPage!;

  int getRowPerPageCustom() {
    int currentVal = _data.to! - _data.from! + 1;
    return currentVal;
  }

  @override
  DataRow getRow(int index) {
    return DataRow(
      color: index % 2 == 1 ? MaterialStateColor.resolveWith((states) => VColor.grey4Opacity) : MaterialStateColor.resolveWith((states) => VColor.transparant),
      cells: [
        dataCell(customerList[index].id!.toString(), Get.width * (5 / 100)),
        dataCell(customerList[index].name!, Get.width * (25 / 100), flex: 6),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (5 / 100),
            ),
            child: Checkbox(
              activeColor: VColor.grey1,
              value: customerList[index].active == "1" ? true : false,
              onChanged: (value) => {},
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (5 / 100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  hoverColor: VColor.transparant,
                  onPressed: () {
                    VNavigation().toCustomerDetailPage(customerList[index].id!);
                  },
                  icon: const Icon(Icons.ads_click, color: VColor.black),
                ),
                IconButton(
                  hoverColor: VColor.transparant,
                  onPressed: () {
                    VNavigation().toCustomerCreatePage(custId: customerList[index].id!);
                  },
                  icon: const Icon(Icons.edit, color: VColor.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DataCell dataCell(String? text, double width, {int flex = 1}) {
    return DataCell(
      Container(
        constraints: BoxConstraints(minWidth: width),
        // width: width,
        padding: const EdgeInsets.only(right: 5),
        child: VText(text ?? "null", align: TextAlign.left),
      ),
    );
  }
}
