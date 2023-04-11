import 'package:akuntansi_flut/modules/item/item_create/item_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/model/item_model.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';

class BuildTableItem extends StatelessWidget {
  const BuildTableItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Theme(
                data: Theme.of(Get.context!).copyWith(cardColor: VColor.white, dividerColor: VColor.primary),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  primary: true,
                  child: GetBuilder<ItemCreateController>(
                    builder: (controller) => ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.minWidth),
                      child: Visibility(
                        visible: controller.isHaveVariant,
                        child: DataTable(
                          rows: controller.dataRow,
                          columnSpacing: 10,
                          horizontalMargin: 10,
                          showCheckboxColumn: false,
                          columns: [
                            tableColumn(controller, "Code", (user) => user.code!, minWidth: Get.width * (4 / 100)),
                            tableColumn(controller, "Name", (user) => user.name!, minWidth: Get.width * (24 / 100)),
                            tableColumn(controller, "Min Price", (user) => int.parse(user.minPrice!), minWidth: Get.width * (6 / 100)),
                            tableColumn(controller, "Price", (user) => int.parse(user.price!), minWidth: Get.width * (4 / 100)),
                            tableColumn(controller, "Active", (user) => user.active!, minWidth: Get.width * (5 / 100)),
                            tableColumn(controller, "Item Picture", null, minWidth: Get.width * (10 / 100)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  DataColumn tableColumn<T>(
    ItemCreateController controller,
    String title,
    Comparable<T> Function(ItemModel user)? sortBy, {
    double minWidth = 100.0,
  }) {
    return DataColumn(
      label: SizedBox(
        width: minWidth,
        child: VText(
          title,
          align: TextAlign.left,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
