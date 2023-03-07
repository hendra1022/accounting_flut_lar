import 'dart:math';

import 'package:akuntansi_flut/services/model/item_model.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:akuntansi_flut/utils/widgets/v_widgets.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';

class ItemController extends BaseController {
  final MyData dataSource = MyData();

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<ItemModel> _data = List.generate(
    200,
    (index) => ItemModel(
      id: index.toString(),
      code: index.toString(),
      name: "item $index",
      categoryId: "1",
      categoryName: "Demo",
      active: "1",
      minPrice: "${Random().nextInt(50000)}",
      price: "${Random().nextInt(50000)}",
      createdDate: "2023-01-01",
      updatedDate: "2023-01-01",
    ),
  );

  void sort<T>(Comparable<T> Function(ItemModel d) getField, bool ascending) {
    _data.sort((ItemModel a, ItemModel b) {
      if (!ascending) {
        final ItemModel c = a;
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
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: const BoxConstraints(minWidth: 50),
            child: VText(_data[index].id!, align: TextAlign.right),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(left: 5),
            constraints: const BoxConstraints(minWidth: 100),
            child: VText(_data[index].name!),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(left: 5),
            constraints: const BoxConstraints(minWidth: 100),
            child: VText(_data[index].categoryName!),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: const BoxConstraints(minWidth: 70),
            child: VText(_data[index].minPrice!.currencyInt, align: TextAlign.right),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: const BoxConstraints(minWidth: 70),
            child: VText(_data[index].price!.currencyInt, align: TextAlign.right),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 5),
              constraints: const BoxConstraints(minWidth: 50),
              child: Checkbox(
                value: _data[index].active == "1" ? true : false,
                onChanged: (value) => {},
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 5),
              constraints: const BoxConstraints(minWidth: 50),
              child: Checkbox(
                value: _data[index].active == "1" ? true : false,
                onChanged: (value) => {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
