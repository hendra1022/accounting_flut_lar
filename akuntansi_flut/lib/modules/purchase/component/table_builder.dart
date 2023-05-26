import 'package:akuntansi_flut/services/model/purchase_header.dart';
import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../purchase.dart';

class PurchaseTable extends StatelessWidget {
  const PurchaseTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : controller.dataSource.dataList.isEmpty
              ? const Center(
                  child: VText("Data is Empty"),
                )
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
                        tableColumn(controller, "No.", (customerType) => customerType.id!, minWidth: Get.width * (5 / 100)),
                        tableColumn(controller, "Date", (customerType) => customerType.purchaseDate!, minWidth: Get.width * (10 / 100)),
                        tableColumn(controller, "Supplier", (customerType) => customerType.sId!, minWidth: Get.width * (25 / 100)),
                        tableColumn(controller, "Net Amount", (customerType) => customerType.netAmount!, minWidth: Get.width * (10 / 100)),
                        tableColumn(controller, " ", null, minWidth: Get.width * (5 / 100)),
                      ],
                    ),
                  ),
                ),
    );
  }

  DataColumn tableColumn<T>(
    PurchaseController controller,
    String title,
    Comparable<T> Function(PurchaseHeader data)? sortBy, {
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
