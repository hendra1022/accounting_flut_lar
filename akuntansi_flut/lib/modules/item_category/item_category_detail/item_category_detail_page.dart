import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'component/table_builder.dart';
import 'item_category_detail.dart';

class ItemCategoryDetailPage extends StatelessWidget {
  const ItemCategoryDetailPage({super.key});

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
          const SizedBox(height: marginSmall),
          GetBuilder<ItemCategoryDetailController>(
            builder: (controller) => controller.isLoading
                ? const VLoadingPage()
                : Expanded(
                    child: ListView(
                      children: const [
                        DetailItem(),
                        SizedBox(
                          height: marginMedium,
                        ),
                        ItemList(),
                      ],
                    ),
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
                  VText(
                    "Item Category",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Item Category Master - Category 1",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  VButton(
                    "Back",
                    buttonColor: VColor.platinum,
                    leftIcon: const Icon(
                      Icons.list,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(width: marginMedium),
                  VButton(
                    "Update",
                    buttonColor: VColor.secondary,
                    leftIcon: const Icon(
                      Icons.edit,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      VNavigation().toItemCategoryCreatePage(itemCat: Get.find<ItemCategoryDetailController>().itemCatId);
                    },
                  ),
                  const SizedBox(width: marginMedium),
                  VButton(
                    "Delete",
                    buttonColor: VColor.red,
                    leftIcon: const Icon(
                      Icons.delete,
                      color: VColor.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({super.key});

  Widget detailField(String title, String field) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: VText(title),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: VText(field),
            ),
          ),
        ],
      ),
    );
  }

  Widget active() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: VText("Active"),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GetBuilder<ItemCategoryDetailController>(
                  builder: (controller) => VCheckbox(
                    isChecked: controller.isActive,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<ItemCategoryDetailController>(
            builder: (controller) => Expanded(
              child: Column(
                children: [
                  detailField("Name", controller.itemCategory.name ?? "-"),
                  const SizedBox(height: marginExtraLarge),
                  active(),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Divider(height: 2, thickness: 2, color: VColor.black),
        SizedBox(height: marginMedium),
        VText(
          "Item List",
          fontSize: textSizeLarge,
        ),
        SizedBox(height: marginMedium),
        Filter(),
        SizedBox(height: marginMedium),
        ItemCategoryDetailTable(),
      ],
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
          GetBuilder<ItemCategoryDetailController>(
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
          child: GetBuilder<ItemCategoryDetailController>(
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
                    controller.changePage(1, true);
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
