import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/item_model.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';

Widget buildTableItem(ItemController controller) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Theme(
      data: Theme.of(Get.context!).copyWith(cardColor: VColor.white, dividerColor: Colors.green),
      child: PaginatedDataTable(
        source: controller.dataSource,
        showFirstLastButtons: true,
        primary: true,
        columnSpacing: 10,
        horizontalMargin: 10,
        rowsPerPage: 15,
        showCheckboxColumn: false,
        columns: [
          tableColumn(controller, "Code", (user) => user.code!, minWidth: 0),
          tableColumn(controller, "Name", (user) => user.name!),
          tableColumn(controller, "Category Name", (user) => user.categoryName!),
          tableColumn(controller, "Min Price", (user) => int.parse(user.minPrice!), numeric: true, minWidth: 70),
          tableColumn(controller, "Price", (user) => int.parse(user.price!), numeric: true, minWidth: 70),
          tableColumn(controller, "Active", (user) => user.active!, minWidth: 50),
          tableColumn(controller, " ", null, minWidth: 50),
        ],
      ),
    ),
  );
}

DataColumn tableColumn<T>(
  ItemController controller,
  String title,
  Comparable<T> Function(ItemModel user)? sortBy, {
  double minWidth = 150.0,
  bool numeric = false,
}) {
  return DataColumn(
    label: Container(
      constraints: BoxConstraints(minWidth: minWidth),
      child: VText(
        title,
        align: numeric ? TextAlign.end : TextAlign.start,
      ),
    ),
    onSort: sortBy != null ? (columnIndex, ascending) => controller.sortData(sortBy, columnIndex, ascending) : null,
    numeric: numeric,
  );
}
