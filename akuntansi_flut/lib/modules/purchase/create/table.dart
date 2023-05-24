import 'package:akuntansi_flut/modules/purchase/create/purchase_create.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/request/purchase_header_line.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';

class PurchaseLineTable extends StatelessWidget {
  const PurchaseLineTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseCreateController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : controller.dataSource.purchaseLineList.isEmpty
              ? const VText("Data is empty")
              : Container(
                  width: double.infinity,
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
                      showFirstLastButtons: true,
                      primary: true,
                      columnSpacing: 10,
                      horizontalMargin: 10,
                      rowsPerPage: controller.dataSource.rowCount >= 15 ? 15 : controller.dataSource.rowCount,
                      showCheckboxColumn: false,
                      columns: [
                        tableColumn(controller, "No.", (user) => user.iId!, minWidth: Get.width * (4 / 100)),
                        tableColumn(controller, "Item Name", (user) => user.itemName!, minWidth: Get.width * (24 / 100)),
                        tableColumn(controller, "Unit Price", (user) => user.unitPrice!, minWidth: Get.width * (8 / 100)),
                        tableColumn(controller, "Net Price", (user) => user.netAmount!, minWidth: Get.width * (8 / 100)),
                        tableColumn(controller, "Qty", (user) => user.qty!, minWidth: Get.width * (8 / 100)),
                      ],
                    ),
                  ),
                ),
    );
  }

  DataColumn tableColumn<T>(
    PurchaseCreateController controller,
    String title,
    Comparable<T> Function(PurchaseLineRequestBody user)? sortBy, {
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

class PurchaseLineDataTableSource extends DataTableSource {
  List<PurchaseLineRequestBody> purchaseLineList = List<PurchaseLineRequestBody>.empty(growable: true);

  void sort<T>(Comparable<T> Function(PurchaseLineRequestBody d) getField, bool ascending) {
    purchaseLineList.sort((PurchaseLineRequestBody a, PurchaseLineRequestBody b) {
      if (!ascending) {
        final PurchaseLineRequestBody c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => purchaseLineList.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      color: index % 2 == 1 ? MaterialStateColor.resolveWith((states) => VColor.grey4Opacity) : MaterialStateColor.resolveWith((states) => VColor.transparant),
      cells: [
        dataCell(
          (index + 1).toString(),
          Get.width * (4 / 100),
        ),
        dataCell(
          purchaseLineList[index].itemName,
          Get.width * (24 / 100),
        ),
        dataCell(
          purchaseLineList[index].unitPrice,
          Get.width * (8 / 100),
        ),
        dataCell(
          purchaseLineList[index].netAmount,
          Get.width * (8 / 100),
          isMoney: true,
        ),
        dataCell(
          purchaseLineList[index].qty ?? "0",
          Get.width * (8 / 100),
        ),
      ],
    );
  }

  DataCell dataCell(
    String? text,
    double width, {
    bool isMoney = false,
  }) {
    return DataCell(
      Container(
        constraints: BoxConstraints(minWidth: width),
        padding: const EdgeInsets.only(right: 5),
        child: VText(
          isMoney ? (text ?? "0").thousandSeparator : (text ?? "-"),
          align: isMoney ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }
}
