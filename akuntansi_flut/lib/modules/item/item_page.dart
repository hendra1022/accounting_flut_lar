import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/modules/app_bar/custom_app_bar_widget.dart';
import 'package:akuntansi_flut/modules/item/component/table_builder.dart';
import 'package:akuntansi_flut/modules/item/item.dart';
import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
      appBar: customAppBar(),
      backgroundColor: VColor.background,
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          const Header(),
          const SizedBox(
            height: marginSmall,
          ),
          const Filter(),
          const SizedBox(
            height: marginMedium,
          ),
          Expanded(
            child: ListView(
              children: const [ItemTable()],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: const EdgeInsets.all(paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  VText(
                    "Dashboard",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: VColor.white,
                  ),
                  const VText(
                    "Item",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Item",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Column(
            children: [
              VButton(
                "CREATE",
                buttonColor: VColor.secondary,
                leftIcon: const Icon(
                  Icons.add,
                  color: VColor.white,
                ),
                onPressed: () {
                  VNavigation().toItemCreatePage();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: VColor.white),
      padding: const EdgeInsets.all(marginMedium),
      child: Wrap(
        children: [
          statusWidget(),
          const SizedBox(
            width: 50,
          ),
          itemCategoryDropdown(),
          const SizedBox(
            width: 50,
          ),
          filterByDropdown(),
        ],
      ),
    );
  }

  Widget statusWidget() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VText(
            "Status",
            fontSize: textSizeLarge,
            isBold: true,
          ),
          GetBuilder<ItemController>(
            builder: (controller) => DropdownButton2(
              hint: const Padding(
                padding: EdgeInsets.only(left: paddingSuperSmall),
                child: VText(
                  'Select Item',
                  fontSize: textSizeMedium,
                  color: VColor.grey1,
                ),
              ),
              items: controller.filterStatusItems
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
              value: controller.selectedFilterStatus,
              onChanged: (value) {
                controller.selectedFilterStatus = value as String;
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
          ),
        ],
      ),
    );
  }

  Widget filterByDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VText(
          "Search",
          fontSize: textSizeLarge,
          isBold: true,
        ),
        Container(
          width: 500,
          decoration: const BoxDecoration(
            color: VColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(radiusMedium),
            ),
          ),
          child: GetBuilder<ItemController>(
            builder: (controller) => Row(
              children: [
                // DropdownButton2(
                //   hint: const Padding(
                //     padding: EdgeInsets.only(left: paddingSuperSmall),
                //     child: VText(
                //       'Select Item',
                //       fontSize: textSizeMedium,
                //       color: VColor.grey1,
                //     ),
                //   ),
                //   items: controller.filterByItems
                //       .map(
                //         (item) => DropdownMenuItem<String>(
                //           value: item,
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: paddingSuperSmall),
                //             child: VText(
                //               item,
                //               fontSize: textSizeMedium,
                //             ),
                //           ),
                //         ),
                //       )
                //       .toList(),
                //   value: controller.selectedFilterBy,
                //   onChanged: (value) {
                //     controller.selectedFilterBy = value as String;
                //     controller.update();
                //   },
                //   buttonStyleData: const ButtonStyleData(
                //     height: 40,
                //     width: 100,
                //   ),
                //   menuItemStyleData: const MenuItemStyleData(
                //     height: 40,
                //   ),
                // ),
                // const SizedBox(
                //   width: marginSmall,
                // ),
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
                  onPressed: () {
                    controller.changePage(1, true, itemCatId: controller.selectedCategory?.id ?? 0);
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget itemCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VText(
          "Item Category",
          fontSize: textSizeLarge,
          isBold: true,
        ),
        GetBuilder<ItemController>(
          builder: (controller) => DropdownButton2<ItemCategory>(
            isExpanded: true,
            hint: const Padding(
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
                      padding: const EdgeInsets.only(left: paddingSuperSmall),
                      child: VText(
                        item.name,
                        fontSize: textSizeMedium,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: controller.selectedCategory,
            onChanged: (value) {
              controller.selectedCategory = value as ItemCategory;
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
          ),
        ),
      ],
    );
  }
}
