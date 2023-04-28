import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/item.dart';
import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item_controller.dart';

class ItemTable extends StatelessWidget {
  const ItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : controller.dataSource.itemList.isEmpty
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
                        controller.changePage(value ~/ controller.dataSource.rowPerPage + 1, false, itemCatId: controller.selectedCategory?.id ?? 0);
                      },
                      columns: [
                        tableColumn(controller, "ID", (item) => item.id!, minWidth: Get.width * (5 / 100)),
                        tableColumn(controller, "Name", (item) => item.name!, minWidth: Get.width * (25 / 100)),
                        tableColumn(controller, "Item Category", (item) => item.icName!, minWidth: Get.width * (25 / 100)),
                        tableColumn(controller, "Active", (item) => item.active!, minWidth: Get.width * (5 / 100)),
                        tableColumn(controller, " ", null, minWidth: Get.width * (5 / 100)),
                      ],
                    ),
                  ),
                ),
    );
  }

  DataColumn tableColumn<T>(
    ItemController controller,
    String title,
    Comparable<T> Function(Item data)? sortBy, {
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
