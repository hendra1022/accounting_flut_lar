import 'package:flutter/material.dart';

import '../../../services/model/item_model.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';

Widget buildTableItem(ItemController controller) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: PaginatedDataTable(
      source: controller.dataSource,
      showFirstLastButtons: true,
      primary: true,
      columnSpacing: 10,
      horizontalMargin: 10,
      rowsPerPage: 15,
      showCheckboxColumn: false,
      columns: [
        tableColumn(controller, "Id", (user) => int.parse(user.id!), numeric: true, minWidth: 0),
        tableColumn(controller, "Name", (user) => user.name!),
        tableColumn(controller, "Category Name", (user) => user.categoryName!),
        tableColumn(controller, "Min Price", (user) => int.parse(user.minPrice!), numeric: true, minWidth: 70),
        tableColumn(controller, "Price", (user) => int.parse(user.price!), numeric: true, minWidth: 70),
        tableColumn(controller, "Active", (user) => user.active!, minWidth: 50),
        tableColumn(controller, "Active", (user) => user.active!, minWidth: 50),
      ],
    ),
  );
}

DataColumn tableColumn<T>(
  ItemController controller,
  String title,
  Comparable<T> Function(ItemModel user) sortBy, {
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
    onSort: (columnIndex, ascending) => controller.sortData(sortBy, columnIndex, ascending),
    numeric: numeric,
  );
}
