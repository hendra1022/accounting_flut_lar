import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../commons/base_controller.dart';
import '../../../services/model/item_model.dart';
import 'table.dart';

class SalesDetailController extends BaseController {
  bool isActive = true;

  DateTime startDate = DateTime.now();
  String startDateView = "";

  final SalesLineDataTableSource dataSource = SalesLineDataTableSource();

  @override
  Future<void> onInit() async {
    isLoading = true;
    startDateView = DateFormat("dd-MM-yyyy").format(startDate);
    isLoading = false;
    update();

    super.onInit();
  }

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }

  Future<void> onSave() async {
    Get.back();
  }
}
