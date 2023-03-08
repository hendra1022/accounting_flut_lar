import 'package:akuntansi_flut/services/model/item_model.dart';

import '../../commons/base_controller.dart';
import 'component/item_data_table_source.dart';

class ItemController extends BaseController {
  final ItemDataTableSource dataSource = ItemDataTableSource();

  void sortData<T>(Comparable<T> Function(ItemModel user) getField, int colIndex, bool ascending) {
    dataSource.sort<T>(getField, ascending);
  }
}
