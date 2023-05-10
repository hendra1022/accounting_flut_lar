import 'package:akuntansi_flut/services/model/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item_model.dart';
import '../../../services/model/supplier.dart';
import 'table.dart';

class PurchaseCreateController extends BaseController {
  TextEditingController supplierTextController = TextEditingController();

  Supplier supplier = Supplier();

  // date
  DateTime transactionDate = DateTime.now();
  String transactionDateView = "";

  // price line
  final PurchaseLineDataTableSource dataSource = PurchaseLineDataTableSource();
  bool isAddItemFormShown = false;

  Item item = Item();
  TextEditingController itemTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController qtyTextController = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoading = true;
    transactionDateView = DateFormat("dd-MM-yyyy").format(transactionDate);
    qtyTextController.text = "0";
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> onSave() async {
    Get.back();
  }

  void updateStartDate(DateTime temp) {
    transactionDate = temp;
    transactionDateView = DateFormat("dd-MM-yyyy").format(transactionDate);
    update();
  }

  void updateAddItemFormVisible() {
    isAddItemFormShown = !isAddItemFormShown;
    priceTextController.text = "0";
    qtyTextController.text = "0";
    update();
  }
}
