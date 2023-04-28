import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/routes/app_navigation.dart';
import '../../../../services/model/item.dart';
import '../../../../services/model/response/item_list.dart';
import '../../../../services/repository/item_repo.dart';
import '../../../../utils/v_color.dart';
import '../../../../utils/widgets/v_widgets.dart';

class ItemCategoryDetailDataTableSource extends DataTableSource {
  ItemListResponse _data = ItemListResponse();
  List<Item> itemList = List<Item>.empty(growable: true);

  void sort<T>(Comparable<T> Function(Item item) getField, bool ascending) {
    itemList.sort((Item a, Item b) {
      if (!ascending) {
        final Item c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  Future<bool> getData(int page, bool reset, {int rowPerPage = 25, String search = "", String active = "1", int itemCatId = 0}) async {
    try {
      if (reset) {
        itemList.clear();
      }
      var response = await ItemRepo().getAllDataBy(page, rowPerPage: rowPerPage, search: search, active: active, itemCatId: itemCatId);
      if (response.code == 200) {
        _data = response.data ?? ItemListResponse();
        itemList.addAll(_data.itemList ?? []);
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
        dataCell(itemList[index].id!.toString(), Get.width * (5 / 100)),
        dataCell(itemList[index].name!, Get.width * (25 / 100), flex: 6),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (5 / 100),
            ),
            child: Checkbox(
              activeColor: VColor.grey1,
              value: itemList[index].active == "1" ? true : false,
              onChanged: (value) => {},
            ),
          ),
        ),
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
                    VNavigation().toItemDetailPage(itemList[index].id!);
                  },
                  icon: const Icon(Icons.ads_click, color: VColor.black),
                ),
                IconButton(
                  hoverColor: VColor.transparant,
                  onPressed: () {
                    VNavigation().toItemCreatePage(itemId: itemList[index].id!);
                  },
                  icon: const Icon(Icons.edit, color: VColor.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  DataCell dataCell(String? text, double width, {int flex = 1}) {
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
