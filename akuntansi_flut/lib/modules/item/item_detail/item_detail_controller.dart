import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item.dart';
import '../../../services/repository/item_repo.dart';
import '../../../utils/constants.dart';

class ItemDetailController extends BaseController {
  bool isActive = true;
  bool isHaveVariant = false;

  int itemId = 0;
  Item item = Item();

  List<Item> variantList = List<Item>.empty(growable: true);
  List<DataRow> dataRow = List<DataRow>.empty(growable: true);

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();

    await getData();
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsItemId] != null) {
      itemId = argumentData[PrefConst.keyArgsItemId];
    }
  }

  Future<void> getData() async {
    try {
      var response = await ItemRepo().getDataById(itemId);
      if (response.code == 200) {
        item = response.data ?? Item();
        isActive = item.active == "1" ? true : false;
      }
    } catch (e) {
      print("error : $e");
    }
  }
}
