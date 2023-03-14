import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../item_category.dart';
import 'filter_by_dropdown.dart';

Widget itemCategoryFilter() {
  return Container(
    padding: EdgeInsets.only(left: marginMedium),
    width: 500,
    decoration: BoxDecoration(
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
