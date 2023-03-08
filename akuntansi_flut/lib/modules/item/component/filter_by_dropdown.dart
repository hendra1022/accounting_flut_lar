import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';

Widget filterByDropdown(ItemController controller) {
  return DropdownButton2(
    hint: Padding(
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
              padding: EdgeInsets.only(left: paddingSuperSmall),
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
  );
}
