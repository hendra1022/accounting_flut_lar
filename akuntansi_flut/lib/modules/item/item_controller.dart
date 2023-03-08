import 'package:akuntansi_flut/services/model/item_model.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';
import 'component/item_data_table_source.dart';

class ItemController extends BaseController {
  final ItemDataTableSource dataSource = ItemDataTableSource();

  // item category
  String? selectedCategory;
  final TextEditingController itemCategorySearchController = TextEditingController();
  final List<String> itemCategoryItems = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  // filter by
  String selectedFilterBy = 'Code';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Code',
    'Nama',
  ];

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }
}
