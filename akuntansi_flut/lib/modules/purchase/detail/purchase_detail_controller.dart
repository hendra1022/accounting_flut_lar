import 'package:akuntansi_flut/services/model/purchase_header.dart';
import 'package:akuntansi_flut/services/repository/purchase_repo.dart';
import 'package:get/get.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item_model.dart';
import '../../../utils/constants.dart';
import 'table.dart';

class PurchaseDetailController extends BaseController {
  bool isActive = true;

  int purchaseId = 0;
  PurchaseHeader purchaseHeader = PurchaseHeader();

  final PurchaseLineDataTableSource dataSource = PurchaseLineDataTableSource();

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    await getPurchaseHeader();
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsPurcId] != null) {
      purchaseId = argumentData[PrefConst.keyArgsPurcId];
    }
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> getPurchaseHeader() async {
    try {
      var response = await PurchaseRepo().getDataById(purchaseId);
      if (response.code == 200) {
        purchaseHeader = response.data ?? PurchaseHeader();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> getPurchaseHeaderLine() async {
    try {
      var response = await PurchaseRepo().getDataById(purchaseId);
      if (response.code == 200) {
        purchaseHeader = response.data ?? PurchaseHeader();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> onSave() async {
    Get.back();
  }
}
