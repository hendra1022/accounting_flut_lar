import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/material.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/customer.dart';
import '../../../services/model/request/customer.dart';
import '../../../services/repository/customer_repo.dart';

class CustomerLookUpController extends BaseController {
  bool isActive = true;

  List<Customer> customerList = List<Customer>.empty(growable: true);
  final TextEditingController customerNameController = TextEditingController();

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
      var response = await CustomerRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        customerList = response.data?.customerList ?? [];
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
      var response = await CustomerRepo().getAllDataBy(0, active: active, rowPerPage: 0, search: itemSearchController.text);
      if (response.code == 200) {
        customerList = response.data?.customerList ?? [];
        update();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> createCustomer() async {
    try {
      var requestBody = CustomerRequest(name: customerNameController.text, active: "1");
      var response = await CustomerRepo().createData(requestBody);
      if (response == "Success") {
        onInit();
      } else {
        VPopup().alertText("Error", response);
      }
    } catch (e) {
      print("Error create customer : $e");
    }
  }
}
