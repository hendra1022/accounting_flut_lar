import 'dart:developer';

import 'package:akuntansi_flut/services/model/purchase_header.dart';
import 'package:akuntansi_flut/services/model/response/purchase_header_list.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../services/repository/purchase_repo.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';

class PurchaseDataTableSource extends DataTableSource {
  PurchaseHeaderListResponse _data = PurchaseHeaderListResponse();
  List<PurchaseHeader> dataList = List<PurchaseHeader>.empty(growable: true);

  void sort<T>(Comparable<T> Function(PurchaseHeader supplier) getField, bool ascending) {
    dataList.sort((PurchaseHeader a, PurchaseHeader b) {
      if (!ascending) {
        final PurchaseHeader c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  Future<bool> getData(int page, bool reset, String startDate, String endDate, {int rowPerPage = 25}) async {
    try {
      if (reset) {
        dataList.clear();
      }
      var response = await PurchaseRepo().getAllDataBy(page, startDate, endDate, rowPerPage: rowPerPage);
      if (response.code == 200) {
        _data = response.data ?? PurchaseHeaderListResponse();
        dataList.addAll(_data.purchaseHeaderList ?? []);
        dataList = dataList.toSet().toList();

        final ids = dataList.map((e) => e.id).toSet();
        dataList.retainWhere((x) => ids.remove(x.id));
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
        dataCell(dataList[index].id!.toString(), Get.width * (5 / 100)),
        dataCell(dataList[index].purchaseDate!.dateDatabaseToView, Get.width * (10 / 100)),
        dataCell(dataList[index].sName.toString(), Get.width * (25 / 100)),
        dataCell(dataList[index].netAmount.toString().thousandSeparator, Get.width * (10 / 100)),
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
                    VNavigation().toPurchaseDetailPage(dataList[index].id!);
                  },
                  icon: const Icon(Icons.ads_click, color: VColor.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DataCell dataCell(String? text, double width) {
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
