import 'package:akuntansi_flut/services/model/purchase_header.dart';
import 'package:akuntansi_flut/services/model/purchase_header_line.dart';
import 'package:akuntansi_flut/services/repository/purchase_repo.dart';

import '../../../commons/base_controller.dart';
import '../../../utils/constants.dart';
import 'table.dart';

class PurchaseDetailController extends BaseController {
  int purchaseId = 0;
  PurchaseHeader purchaseHeader = PurchaseHeader();

  final PurchaseLineDataTableSource dataSource = PurchaseLineDataTableSource();
  int page = 1;
  int rowPerPage = 10;

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    await getPurchaseHeader();
    await dataSource.getData(page, true, purchaseId, rowPerPage: rowPerPage);
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsPurcId] != null) {
      purchaseId = argumentData[PrefConst.keyArgsPurcId];
    }
  }

  void sortData<T>(Comparable<T> Function(PurchaseHeaderLine user) getField, int colIndex, bool ascending) {
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

  Future<void> changePage(int page, bool reset, {int rowPerPageTemp = 0}) async {
    rowPerPage = rowPerPageTemp <= 0 ? rowPerPage : rowPerPageTemp;
    isLoading = true;
    update();
    this.page = page;

    await dataSource.getData(page, reset, purchaseId, rowPerPage: rowPerPage);
    isLoading = false;
    update();
  }
}
