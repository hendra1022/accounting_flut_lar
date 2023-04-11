import 'dart:math';

import 'package:akuntansi_flut/utils/constants.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item_model.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';

class ItemCreateController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController codeTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController hppTextController = TextEditingController();
  TextEditingController categoryTextController = TextEditingController();
  TextEditingController customerTaxTextController = TextEditingController();
  TextEditingController supplierTaxTextController = TextEditingController();

  bool isHaveVariant = false;
  bool isCategoryPicked = false;
  bool isCustoemrTaxPicked = false;
  bool isSupplierTaxPicked = false;
  bool isActive = true;
  bool isFormShow = false;

  List<DataRow> dataRow = List<DataRow>.empty(growable: true);
  final List<ItemModel> itemList = List.generate(
    2,
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

  @override
  Future<void> onInit() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    await initLocalData();
    isLoading = false;
    update();
    super.onInit();
  }

  Future<void> initLocalData() async {
    for (var i = 0; i < itemList.length; i++) {
      dataRow.add(getRow(i));
    }
  }

  Future<void> onSave() async {
    Get.back();
  }

  void updateIsHaveVariant() {
    isHaveVariant = !isHaveVariant;
    isFormShow = false;
    update();
  }

  void updateIsActive() {
    isActive = !isActive;
    update();
  }

  void updateIsFormShow() {
    isFormShow = !isFormShow;
    update();
  }

  DataRow getRow(int index) {
    DataCell dataCell(
      String? text,
      double width, {
      bool isMoney = false,
    }) {
      return DataCell(
        Container(
          constraints: BoxConstraints(minWidth: width),
          padding: const EdgeInsets.only(right: 5),
          child: VText(
            isMoney ? (text ?? "0").thousandSeparator : (text ?? "-"),
            align: isMoney ? TextAlign.right : TextAlign.left,
          ),
        ),
      );
    }

    return DataRow(
      color: index % 2 == 1 ? MaterialStateColor.resolveWith((states) => VColor.grey4Opacity) : MaterialStateColor.resolveWith((states) => VColor.transparant),
      cells: [
        dataCell(itemList[index].code, Get.width * (4 / 100)),
        dataCell(itemList[index].name, Get.width * (24 / 100)),
        dataCell(itemList[index].minPrice, Get.width * (6 / 100), isMoney: true),
        dataCell(itemList[index].price, Get.width * (4 / 100), isMoney: true),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (5 / 100),
            ),
            child: Checkbox(
              value: itemList[index].active == "1" ? true : false,
              onChanged: (value) => {},
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (10 / 100),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: marginSuperSmall),
              width: 150,
              child: VButton(
                "Browser",
                leftIcon: const Icon(Icons.download),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
