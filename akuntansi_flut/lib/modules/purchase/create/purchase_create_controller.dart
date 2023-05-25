import 'package:akuntansi_flut/services/model/item.dart';
import 'package:akuntansi_flut/services/model/request/purchase_header_line.dart';
import 'package:akuntansi_flut/services/repository/purchase_repo.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/supplier.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import 'table.dart';

class PurchaseCreateController extends BaseController {
  TextEditingController supplierTextController = TextEditingController();
  TextEditingController noteHeaderTextController = TextEditingController();

  Supplier supplier = Supplier();

  // date
  DateTime transactionDate = DateTime.now();
  String transactionDateView = "";

  // price line
  List<PurchaseLineRequestBody> purchaseLineList = List<PurchaseLineRequestBody>.empty(growable: true);
  final PurchaseLineDataTableSource dataSource = PurchaseLineDataTableSource();
  bool isAddItemFormShown = false;

  Item item = Item();
  TextEditingController itemTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  int inputPrice = 0;
  TextEditingController qtyTextController = TextEditingController();
  int inputQty = 0;
  TextEditingController noteLineTextController = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoading = true;
    transactionDateView = DateFormat("dd-MM-yyyy").format(transactionDate);
    qtyTextController.text = "0";
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(PurchaseLineRequestBody user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  void updateStartDate(DateTime temp) {
    transactionDate = temp;
    transactionDateView = DateFormat("dd-MM-yyyy").format(transactionDate);
    update();
  }

  void updateAddItemFormVisible() {
    isAddItemFormShown = !isAddItemFormShown;
    item = Item();
    priceTextController.text = "0";
    inputPrice = 0;
    qtyTextController.text = "0";
    inputQty = 0;
    noteLineTextController.text = "";
    update();
  }

  void updatePrice(String value) {
    if (value.isEmpty) {
      priceTextController.text = "0";
      priceTextController.selection = TextSelection.fromPosition(TextPosition(offset: priceTextController.text.length));
    } else if (value[0] == "0" && value.length > 1) {
      priceTextController.text = value.replaceFirst("0", "");
      priceTextController.selection = TextSelection.fromPosition(TextPosition(offset: priceTextController.text.length));
    }
    inputPrice = int.tryParse(priceTextController.text.replaceAll(",", "")) ?? double.tryParse(priceTextController.text.replaceAll(",", ""))?.round() ?? 0;
  }

  void updateQuantity(String value) {
    if (value.isEmpty) {
      qtyTextController.text = "0";
      qtyTextController.selection = TextSelection.fromPosition(TextPosition(offset: qtyTextController.text.length));
    } else if (value[0] == "0" && value.length > 1) {
      qtyTextController.text = value.replaceFirst("0", "");
      qtyTextController.selection = TextSelection.fromPosition(TextPosition(offset: qtyTextController.text.length));
    }
    inputQty = int.tryParse(qtyTextController.text.replaceAll(",", "")) ?? double.tryParse(qtyTextController.text.replaceAll(",", ""))?.round() ?? 0;
  }

  Future<void> onAddPurchaseLine() async {
    isLoading = true;
    update();
    if (item.id == null || priceTextController.text.isOnlyContainNumber() || qtyTextController.text.isOnlyContainNumber()) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "All field must be filled!",
        color: VColor.white,
      )));
    } else {
      int netAmountTemp = priceTextController.text.convertToInt() * qtyTextController.text.convertToInt();
      var lineTemp = PurchaseLineRequestBody(
        iId: item.id!.toString(),
        itemName: item.name,
        netAmount: netAmountTemp.toString(),
        qty: qtyTextController.text,
        unitPrice: priceTextController.text,
        note: noteLineTextController.text,
      );
      purchaseLineList.add(lineTemp);

      dataSource.purchaseLineList.add(lineTemp);
    }

    await Future.delayed(const Duration(milliseconds: 250));

    isLoading = false;
    update();
    updateAddItemFormVisible();
  }

  Future<void> onSave() async {
    VPopup().loading();

    if (purchaseLineList.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "Purchase item cannot be empty!",
        color: VColor.white,
      )));
      Get.back();
    } else if (supplier.id == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "Supplier cannot be empty!",
        color: VColor.white,
      )));
      Get.back();
    } else {
      var grossAmount = 0;
      for (var element in purchaseLineList) {
        grossAmount += element.netAmount!.convertToInt();
      }

      PurchaseHeaderLineRequestBody requestBody = PurchaseHeaderLineRequestBody(
        grossAmount: grossAmount.toString(),
        netAmount: grossAmount.toString(),
        note: noteHeaderTextController.text,
        purchaseDate: transactionDateView,
        sId: supplier.id!.toString(),
        data: purchaseLineList,
      );
      try {
        var response = await PurchaseRepo().createDataCombo(requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toPurchasePage();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: VText(
            response,
            color: VColor.white,
          )));
          Get.back();
        }
      } catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: VText(
          e.toString(),
          color: VColor.white,
        )));
        Get.back();
      }
    }
  }
}
