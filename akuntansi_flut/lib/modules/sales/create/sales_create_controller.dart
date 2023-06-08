import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../services/model/customer.dart';
import '../../../services/model/item.dart';
import '../../../services/model/request/sales_header.dart';
import '../../../services/model/request/sales_header_line.dart';
import '../../../services/repository/sales_repo.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';
import 'table.dart';

class SalesCreateController extends BaseController {
  TextEditingController customerTextController = TextEditingController();
  TextEditingController noteHeaderTextController = TextEditingController();

  Customer customer = Customer();

  // date
  DateTime transactionDate = DateTime.now();
  String transactionDateView = "";

  // price line
  List<SalesLineRequest> salesLineList = List<SalesLineRequest>.empty(growable: true);
  final SalesLineDataTableSource dataSource = SalesLineDataTableSource();
  bool isAddItemFormShown = false;

  int index = 1;

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

  void sortData<T>(Comparable<T> Function(SalesLineRequest user) getField, int colIndex, bool ascending) {
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
    inputPrice = int.tryParse(priceTextController.text.replaceAll(".", "")) ?? double.tryParse(priceTextController.text.replaceAll(".", ""))?.round() ?? 0;
  }

  void updateQuantity(String value) {
    if (value.isEmpty) {
      qtyTextController.text = "0";
      qtyTextController.selection = TextSelection.fromPosition(TextPosition(offset: qtyTextController.text.length));
    } else if (value[0] == "0" && value.length > 1) {
      qtyTextController.text = value.replaceFirst("0", "");
      qtyTextController.selection = TextSelection.fromPosition(TextPosition(offset: qtyTextController.text.length));
    }
    inputQty = int.tryParse(qtyTextController.text.replaceAll(".", "")) ?? double.tryParse(qtyTextController.text.replaceAll(".", ""))?.round() ?? 0;
  }

  Future<void> onAddSalesLine() async {
    isLoading = true;
    update();
    if (item.id == null || priceTextController.text.isOnlyContainNumber() || qtyTextController.text.isOnlyContainNumber()) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "All field must be filled!",
        color: VColor.white,
      )));
    } else {
      int netAmountTemp = inputPrice * inputQty;
      var lineTemp = SalesLineRequest(
        lineNo: index.toString(),
        iId: item.id!.toString(),
        itemName: item.name,
        netAmount: netAmountTemp.toString(),
        qty: inputQty.toString(),
        unitPrice: inputPrice.toString(),
        note: noteLineTextController.text,
      );
      salesLineList.add(lineTemp);

      dataSource.salesLineList.add(lineTemp);
      index++;
    }

    await Future.delayed(const Duration(milliseconds: 250));

    isLoading = false;
    update();
    updateAddItemFormVisible();
  }

  Future<void> onSave() async {
    VPopup().loading();

    if (salesLineList.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "Sales item cannot be empty!",
        color: VColor.white,
      )));
      Get.back();
    } else if (customer.id == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: VText(
        "Supplier cannot be empty!",
        color: VColor.white,
      )));
      Get.back();
    } else {
      var grossAmount = 0;
      for (var element in salesLineList) {
        grossAmount += element.netAmount!.convertToInt();
      }

      SalesHeaderRequest requestBody = SalesHeaderRequest(
        grossAmount: grossAmount.toString(),
        netAmount: grossAmount.toString(),
        note: noteHeaderTextController.text,
        transactionDate: transactionDateView,
        cId: customer.id!.toString(),
        salesHeaderList: salesLineList,
      );
      try {
        var response = await SalesRepo().createData(requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toSalesPage();
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
