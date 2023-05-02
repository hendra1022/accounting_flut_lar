import 'package:akuntansi_flut/services/model/item.dart';
import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/model/request/item.dart';
import 'package:akuntansi_flut/services/repository/item_category_repo.dart';
import 'package:akuntansi_flut/services/repository/item_repo.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../commons/routes/app_navigation.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_popup.dart';
import '../../../utils/widgets/v_widgets.dart';

class ItemCreateController extends BaseController {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameTextController = TextEditingController();
  TextEditingController categoryTextController = TextEditingController();

  bool isHaveVariant = false;
  bool isActive = true;
  bool isFormShow = false;

  int itemId = 0;
  Item item = Item();
  ItemCategory itemCategory = ItemCategory();

  List<Item> variantList = List<Item>.empty(growable: true);
  List<DataRow> dataRow = List<DataRow>.empty(growable: true);

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
        dataCell(variantList[index].id.toString(), Get.width * (4 / 100)),
        dataCell(variantList[index].name, Get.width * (24 / 100)),
        DataCell(
          Container(
            padding: const EdgeInsets.only(right: 5),
            constraints: BoxConstraints(
              minWidth: Get.width * (5 / 100),
            ),
            child: Checkbox(
              value: variantList[index].active == "1" ? true : false,
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

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    if (itemId != 0) {
      await getData();
    }
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
        var responseItemCat = await ItemCategoryRepo().getDataById(item.icId!);
        itemCategory = responseItemCat.data ?? ItemCategory();
        fillData();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  void fillData() {
    isActive = item.active == "1" ? true : false;
    nameTextController.text = item.name ?? "";
    categoryTextController.text = item.icName ?? "";
  }

  Future<void> onSave() async {
    if (itemId == 0) {
      await createItem();
    } else {
      await updateItem();
    }
  }

  Future<void> createItem() async {
    try {
      VPopup().loading();

      if (itemCategory.id == 0 || itemCategory.id == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "All field must be filled!",
          color: VColor.white,
        )));
        Get.back();
      } else {
        var requestBody = ItemRequest(
          name: nameTextController.text,
          active: isActive ? "1" : "0",
          haveChild: isHaveVariant ? "1" : "0",
          parentId: "0",
          icId: (itemCategory.id!).toString(),
        );
        var response = await ItemRepo().createData(requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toItemPage();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: VText(
            response,
            color: VColor.white,
          )));
          Get.back();
        }
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }

  Future<void> updateItem() async {
    try {
      VPopup().loading();

      if (itemCategory.id == 0) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            content: VText(
          "All field must be filled!",
          color: VColor.white,
        )));
        Get.back();
      } else {
        var requestBody = ItemRequest(
          name: nameTextController.text,
          active: isActive ? "1" : "0",
          haveChild: isHaveVariant ? "1" : "0",
          parentId: "0",
          icId: (itemCategory.id ?? 0).toString(),
        );
        var response = await ItemRepo().updateData(itemId, requestBody);
        if (response == "Success") {
          ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
              content: VText(
            "Success",
            color: VColor.white,
          )));
          Get.back();
          VNavigation().toItemPage();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
              content: VText(
            response,
            color: VColor.white,
          )));
          Get.back();
        }
      }
    } catch (e) {
      VPopup().alertText("Error", "$e");
    }
  }
}
