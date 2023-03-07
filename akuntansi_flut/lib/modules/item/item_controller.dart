import 'dart:math';

import 'package:akuntansi_flut/services/model/item_model.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';

class ItemController extends BaseController {
  final MyData dataSource = MyData();

  void sort<T>(
    Comparable<T> Function(ItemModel user) getField,
    int colIndex,
    bool asc,
    MyData src,
  ) {
    src.sort<T>(getField, asc);
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<ItemModel> _data = List.generate(
    200,
    (index) => ItemModel(
      id: index.toString(),
      name: "item $index",
      categoryId: "1",
      harga: "${Random().nextInt(50000)}",
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
    return DataRow(cells: [
      DataCell(Text(_data[index].id!)),
      DataCell(Text(_data[index].name!)),
      DataCell(Text(_data[index].categoryId!)),
      DataCell(Text(_data[index].categoryId!)),
    ]);
  }
}
