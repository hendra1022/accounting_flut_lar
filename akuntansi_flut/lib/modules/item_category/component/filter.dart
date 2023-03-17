import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item_category.dart';

class ItemCategoryFilter extends StatelessWidget {
  const ItemCategoryFilter({super.key});

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
      child: GetBuilder<ItemCategoryController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton2(
                  hint: const Padding(
                    padding: EdgeInsets.only(left: paddingSuperSmall),
                    child: VText(
                      'Select Item',
                      fontSize: textSizeMedium,
                      color: VColor.grey1,
                    ),
                  ),
                  items: controller.filterByItems
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.only(left: paddingSuperSmall),
                            child: VText(
                              item,
                              fontSize: textSizeMedium,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  value: controller.selectedFilterBy,
                  onChanged: (value) {
                    controller.selectedFilterBy = value as String;
                    controller.update();
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 100,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
                const SizedBox(width: marginSmall),
                SizedBox(
                  width: 250,
                  child: VInputText(
                    hint: "Search item by ${controller.selectedFilterBy}",
                    textEditingController: controller.itemSearchController,
                    autoFocus: false,
                  ),
                ),
                const SizedBox(width: marginSmall),
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
