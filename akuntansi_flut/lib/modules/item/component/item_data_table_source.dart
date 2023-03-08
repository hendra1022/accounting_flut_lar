import 'dart:math';

import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../services/model/item_model.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';

class ItemDataTableSource extends DataTableSource {
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
      color: index % 2 == 1 ? MaterialStateColor.resolveWith((states) => VColor.grey4Opacity) : MaterialStateColor.resolveWith((states) => VColor.transparant),
      cells: [
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: const BoxConstraints(minWidth: 50),
            child: VText(_data[index].code!, align: TextAlign.left),
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
                activeColor: VColor.grey1,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      hoverColor: VColor.transparant,
                      onPressed: () {
                        VNavigation().toItemDetailPage(int.parse(_data[index].id!));
                      },
                      icon: const Icon(Icons.ads_click, color: VColor.black),
                    ),
                    IconButton(
                      hoverColor: VColor.transparant,
                      onPressed: () {},
                      icon: const Icon(Icons.edit, color: VColor.blue),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
