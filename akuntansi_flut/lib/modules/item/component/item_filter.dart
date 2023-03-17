import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';
import 'filter_by_dropdown.dart';
import 'item_category_dropdown.dart';

class ItemFilter extends StatelessWidget {
  const ItemFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: marginMedium),
      width: 500,
      decoration: const BoxDecoration(
        color: VColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radiusMedium),
        ),
      ),
      child: GetBuilder<ItemController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const VText("Item Category"),
                const SizedBox(
                  width: marginMedium,
                ),
                itemCategoryDropdown(controller),
              ],
            ),
            const SizedBox(
              height: marginMedium,
            ),
            Row(
              children: [
                filterByDropdown(controller),
                const SizedBox(
                  width: marginSmall,
                ),
                SizedBox(
                  width: 250,
                  child: VInputText(
                    hint: "Search item by ${controller.selectedFilterBy}",
                    textEditingController: controller.itemSearchController,
                    autoFocus: false,
                  ),
                ),
                const SizedBox(
                  width: marginSmall,
                ),
                VButton(
                  "Filter",
                  leftIcon: const Icon(
                    Icons.search,
                    color: VColor.white,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
