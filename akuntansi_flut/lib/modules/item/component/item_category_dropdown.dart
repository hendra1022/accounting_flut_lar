import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';

Widget itemCategoryDropdown(ItemController controller) {
  return DropdownButton2<String>(
    isExpanded: true,
    hint: Padding(
      padding: EdgeInsets.only(left: paddingSuperSmall),
      child: VText(
        'All Category',
        fontSize: textSizeMedium,
      ),
    ),
    items: controller.itemCategoryItems
        .map(
          (item) => DropdownMenuItem(
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
    value: controller.selectedCategory,
    onChanged: (value) {
      controller.selectedCategory = value as String;
      controller.update();
    },
    buttonStyleData: const ButtonStyleData(
      height: 40,
      width: 200,
    ),
    dropdownStyleData: const DropdownStyleData(
      maxHeight: 300,
    ),
    menuItemStyleData: const MenuItemStyleData(
      height: 40,
    ),
    dropdownSearchData: DropdownSearchData(
      searchController: controller.itemCategorySearchController,
      searchInnerWidgetHeight: 50,
      searchInnerWidget: Container(
        height: 50,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 4,
          right: 8,
          left: 8,
        ),
        child: TextFormField(
          expands: true,
          maxLines: null,
          controller: controller.itemCategorySearchController,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            hintText: 'Search for an item...',
            hintStyle: const TextStyle(fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hoverColor: null,
          ),
        ),
      ),
      searchMatchFn: (item, searchValue) {
        return (item.value.toString().contains(searchValue));
      },
    ),
    onMenuStateChange: (isOpen) {
      if (!isOpen) {
        controller.itemCategorySearchController.clear();
      }
    },
  );
}
