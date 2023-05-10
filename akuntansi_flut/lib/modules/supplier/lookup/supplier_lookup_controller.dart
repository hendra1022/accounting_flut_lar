import 'package:akuntansi_flut/services/model/request/supplier.dart';
import 'package:akuntansi_flut/services/model/supplier.dart';
import 'package:akuntansi_flut/services/repository/supplier_repo.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';

class SupplierLookUpController extends BaseController {
  bool isActive = true;

  List<Supplier> supplierList = List<Supplier>.empty(growable: true);
  final TextEditingController supplierNameController = TextEditingController();

  // filter by status
  String selectedFilterStatus = 'Active';
  final List<String> filterStatusItems = [
    'All',
    'Active',
    'Non-Active',
  ];

  // filter by name
  String selectedFilterBy = 'Name';
  final TextEditingController itemSearchController = TextEditingController();
  final List<String> filterByItems = [
    'Name',
    'Code',
  ];

  @override
  Future<void> onInit() async {
    isLoading = true;
    update();
    await getData();
    itemSearchController.text = "";
    isLoading = false;
    update();

    super.onInit();
  }

  Future<void> search() async {
    isLoading = true;
    update();
    String active = "1";

    if (selectedFilterStatus == "Active") {
      active = "1";
    } else if (selectedFilterStatus == "Non-Active") {
      active = "0";
    } else {
      active = "";
    }

    try {
      var response = await SupplierRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        supplierList = response.data?.supplierList ?? [];
      }
    } catch (e) {
      print("error : $e");
    }
    isLoading = false;
    update();
  }

  Future<void> getData() async {
    String active = "1";

    if (selectedFilterStatus == "Active") {
      active = "1";
    } else if (selectedFilterStatus == "Non-Active") {
      active = "0";
    } else {
      active = "";
    }

    try {
      var response = await SupplierRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        supplierList = response.data?.supplierList ?? [];
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> createSupplier() async {
    try {
      var requestBody = SupplierRequest(name: supplierNameController.text, active: "1");
      var response = await SupplierRepo().createData(requestBody);
      if (response == "Success") {
        onInit();
      } else {
        VPopup().alertText("Error", response);
      }
    } catch (e) {
      print("Error create supplier : $e");
    }
  }
}
