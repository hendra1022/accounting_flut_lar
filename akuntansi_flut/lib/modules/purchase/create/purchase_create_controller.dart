import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item_model.dart';
import 'table.dart';

class PurchaseCreateController extends BaseController {
  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  // filter by date
  DateTime startDate = DateTime.now();
  String startDateView = "";

  // price line
  final PurchaseLineDataTableSource dataSource = PurchaseLineDataTableSource();
  bool isAddItemFormShown = false;

  TextEditingController priceTextController = TextEditingController();
  TextEditingController qtyTextController = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoading = true;
    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
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
    startDate = temp;
    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
    update();
  }

  void updateAddItemFormVisible() {
    isAddItemFormShown = !isAddItemFormShown;
    priceTextController.text = "0";
    qtyTextController.text = "0";
    update();
  }
}
