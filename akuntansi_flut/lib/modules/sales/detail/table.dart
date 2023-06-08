import 'dart:developer';

import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/response/sales_header_line_list.dart';
import '../../../services/model/sales_header_line.dart';
import '../../../services/repository/sales_repo.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';
import 'sales_detail.dart';

class SalesLineTable extends StatelessWidget {
  const SalesLineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesDetailController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : controller.dataSource.itemList.isEmpty
              ? const Center(child: VText("Data is Empty"))
              : Container(
                  decoration: const BoxDecoration(
                    color: VColor.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(radiusMedium),
                    ),
                  ),
                  child: Theme(
                    data: Theme.of(Get.context!).copyWith(cardColor: VColor.white, dividerColor: VColor.primary),
                    child: PaginatedDataTable(
                      source: controller.dataSource,
                      primary: true,
                      columnSpacing: 10,
                      horizontalMargin: 10,
                      rowsPerPage: controller.dataSource.getRowPerPageCustom(),
                      initialFirstRowIndex: (controller.page - 1) * controller.dataSource.rowPerPage,
                      showCheckboxColumn: false,
                      onPageChanged: (value) {
                        controller.changePage(value ~/ controller.dataSource.rowPerPage + 1, false);
                      },
                      columns: [
                        tableColumn(controller, "No.", (item) => item.iId!, minWidth: Get.width * (4 / 100)),
                        tableColumn(controller, "Item Name", (item) => item.iName!, minWidth: Get.width * (24 / 100)),
                        tableColumn(controller, "Unit Price", (item) => item.unitPrice!, minWidth: Get.width * (8 / 100)),
                        tableColumn(controller, "Net Price", (item) => item.netAmount!, minWidth: Get.width * (8 / 100)),
                        tableColumn(controller, "Qty", (item) => item.qty!, minWidth: Get.width * (8 / 100)),
                      ],
                    ),
                  ),
                ),
    );
  }

  DataColumn tableColumn<T>(
    SalesDetailController controller,
    String title,
    Comparable<T> Function(SalesHeaderLine data)? sortBy, {
    double minWidth = 100.0,
  }) {
    return DataColumn(
      label: SizedBox(
        width: minWidth,
        child: VText(
          title,
          align: TextAlign.left,
          overflow: TextOverflow.clip,
        ),
      ),
      onSort: sortBy != null ? (columnIndex, ascending) => controller.sortData(sortBy, columnIndex, ascending) : null,
    );
  }
}

class SalesLineDataTableSource extends DataTableSource {
  SalesHeaderLineListResponse _data = SalesHeaderLineListResponse();
  List<SalesHeaderLine> itemList = List<SalesHeaderLine>.empty(growable: true);

  void sort<T>(Comparable<T> Function(SalesHeaderLine item) getField, bool ascending) {
    itemList.sort((SalesHeaderLine a, SalesHeaderLine b) {
      if (!ascending) {
        final SalesHeaderLine c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  Future<bool> getData(int page, bool reset, int phId, {int rowPerPage = 25}) async {
    try {
      if (reset) {
        itemList.clear();
      }
      var response = await SalesRepo().getAllDataLine(page, phId, rowPerPage: rowPerPage);
      if (response.code == 200) {
        _data = response.data ?? SalesHeaderLineListResponse();
        itemList.addAll(_data.salesHeaderLineList ?? []);
        itemList = itemList.toSet().toList();

        final ids = itemList.map((e) => e.id).toSet();
        itemList.retainWhere((x) => ids.remove(x.id));
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
        dataCell((itemList[index].lineNo ?? (index + 1)).toString(), Get.width * (4 / 100)),
        dataCell(itemList[index].iName, Get.width * (24 / 100)),
        dataCell((itemList[index].unitPrice ?? 0).toString().thousandSeparator, Get.width * (8 / 100)),
        dataCell((itemList[index].netAmount ?? 0).toString().thousandSeparator, Get.width * (8 / 100)),
        dataCell((itemList[index].qty ?? 0).toString().thousandSeparator, Get.width * (8 / 100)),
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
