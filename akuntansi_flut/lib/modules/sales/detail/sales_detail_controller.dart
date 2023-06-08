import 'package:akuntansi_flut/services/model/sales_header.dart';
import 'package:akuntansi_flut/services/model/sales_header_line.dart';
import 'package:akuntansi_flut/services/repository/sales_repo.dart';

import '../../../commons/base_controller.dart';
import '../../../utils/constants.dart';
import 'table.dart';

class SalesDetailController extends BaseController {
  int salesId = 0;
  SalesHeader salesHeader = SalesHeader();

  final SalesLineDataTableSource dataSource = SalesLineDataTableSource();
  int page = 1;
  int rowPerPage = 10;

  @override
  Future<void> onInit() async {
    isLoading = true;
    getArgumentData();
    await getSalesHeader();
    await dataSource.getData(page, true, salesId, rowPerPage: rowPerPage);
    isLoading = false;
    update();

    super.onInit();
  }

  void getArgumentData() {
    if (argumentData[PrefConst.keyArgsSalesId] != null) {
      salesId = argumentData[PrefConst.keyArgsSalesId];
    }
  }

  void sortData<T>(Comparable<T> Function(SalesHeaderLine user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> getSalesHeader() async {
    try {
      var response = await SalesRepo().getDataById(salesId);
      if (response.code == 200) {
        salesHeader = response.data ?? SalesHeader();
      }
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> getSalesHeaderLine() async {
    try {
      var response = await SalesRepo().getDataById(salesId);
      if (response.code == 200) {
        salesHeader = response.data ?? SalesHeader();
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

    await dataSource.getData(page, reset, salesId, rowPerPage: rowPerPage);
    isLoading = false;
    update();
  }
}
