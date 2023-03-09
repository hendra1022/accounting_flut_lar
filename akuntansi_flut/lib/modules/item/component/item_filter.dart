import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item.dart';
import 'filter_by_dropdown.dart';
import 'item_category_dropdown.dart';

Widget itemFilter() {
  return Container(
    padding: EdgeInsets.only(left: marginMedium),
    width: 500,
    decoration: BoxDecoration(
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
              SizedBox(
                width: marginMedium,
              ),
              itemCategoryDropdown(controller),
            ],
          ),
          SizedBox(
            height: marginMedium,
          ),
          Row(
            children: [
              filterByDropdown(controller),
              SizedBox(
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
              SizedBox(
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
