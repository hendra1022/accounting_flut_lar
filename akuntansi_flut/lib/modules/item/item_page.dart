import 'package:akuntansi_flut/modules/item/item.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return GetBuilder<ItemController>(
      builder: (controller) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingSmall),
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: marginMedium,
            ),
            SingleChildScrollView(
              child: PaginatedDataTable(
                source: controller.dataSource,
                columns: [
                  const DataColumn(
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: const Text('Name'),
                    onSort: (columnIndex, ascending) => controller.sort((user) => int.parse(user.id!), columnIndex, !ascending, controller.dataSource),
                  ),
                  const DataColumn(label: Text('Category Id')),
                  const DataColumn(label: Text('Price')),
                ],
                columnSpacing: 100,
                horizontalMargin: 10,
                rowsPerPage: 55,
                showCheckboxColumn: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: EdgeInsets.all(paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VText(
            "subTitle",
            fontSize: textSizeMedium,
            color: VColor.white,
          ),
          SizedBox(
            height: marginSuperSmall,
          ),
          VText(
            "Item",
            fontSize: textSizeLarge,
            color: VColor.white,
          ),
        ],
      ),
    );
  }
}
