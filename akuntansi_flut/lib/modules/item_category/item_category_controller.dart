import 'package:akuntansi_flut/modules/item_category/component/item_category_data_table_source.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';
import '../../services/model/item_model.dart';

class ItemCategoryController extends BaseController {
  final ItemCategoryDataTableSource dataSource = ItemCategoryDataTableSource();
  // filter by
  String selectedFilterBy = 'Code';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Code',
    'Nama',
  ];

  @override
  Future<void> onInit() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }
}
