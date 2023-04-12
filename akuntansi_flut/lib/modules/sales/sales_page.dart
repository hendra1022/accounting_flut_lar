import 'package:akuntansi_flut/modules/sales/component/table_builder.dart';
import 'package:akuntansi_flut/modules/sales/sales.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/routes/app_navigation.dart';
import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';
import '../app_bar/custom_app_bar.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

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
          Expanded(
            child: ListView(
              children: const [
                Filter(),
                SizedBox(height: marginMedium),
                SalesTable(),
              ],
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
                    "Sales",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Sales",
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
                  VNavigation().toSalesCreatePage();
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
      decoration: const BoxDecoration(color: VColor.white),
      padding: const EdgeInsets.all(marginMedium),
      child: Wrap(
        children: [
          dateFilter(),
          const SizedBox(
            width: 30,
          ),
          filterByDropdown(),
        ],
      ),
    );
  }

  Widget dateFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: marginMedium),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VText("Date"),
          const SizedBox(
            width: marginSmall,
          ),
          GetBuilder<SalesController>(
            builder: (controller) => GestureDetector(
              onTap: () => showDatePickerStartDate(controller),
              child: VText(
                controller.startDateView,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            width: marginSmall,
          ),
          const VText("-"),
          const SizedBox(
            width: marginSmall,
          ),
          GetBuilder<SalesController>(
            builder: (controller) => VText(
              controller.endDateView,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget filterByDropdown() {
    return Container(
      width: 700,
      decoration: const BoxDecoration(
        color: VColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radiusMedium),
        ),
      ),
      child: GetBuilder<SalesController>(
        builder: (controller) => Row(
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
                width: 150,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
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
        ),
      ),
    );
  }

  Future<void> showDatePickerStartDate(SalesController controller) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: controller.startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != controller.startDate) {
      controller.updateStartDate(picked);
    }
  }
}
