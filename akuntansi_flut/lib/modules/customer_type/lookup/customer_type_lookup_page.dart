import 'package:akuntansi_flut/services/model/customer_type.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'customer_type_lookup.dart';

class CustomerTypeLookUpPage extends StatelessWidget {
  const CustomerTypeLookUpPage({super.key});

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
          const Filter(),
          const SizedBox(height: marginSmall),
          Expanded(
            child: GetBuilder<CustomerTypeLookUpController>(
              builder: (controller) => controller.isLoading
                  ? const VLoadingPage()
                  : controller.customerTypeList.isEmpty
                      ? const Center(
                          child: VText("Data is empty!"),
                        )
                      : Container(
                          padding: const EdgeInsets.all(paddingSmall),
                          decoration: BoxDecoration(color: VColor.white, borderRadius: BorderRadius.circular(radiusSmall)),
                          child: ListView.builder(
                            itemCount: controller.customerTypeList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => _childList(controller.customerTypeList[index]),
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _childList(CustomerType customerType) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VText(customerType.name ?? "-"),
              VIconButton(
                Icons.check,
                onPressed: () {
                  Get.back(result: {PrefConst.keyArgsCustType: customerType});
                },
              ),
            ],
          ),
          const Divider(
            color: VColor.grey1,
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
                    "Customer Type",
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
                    "View",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Customer Type LookUp",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
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
          GetBuilder<CustomerTypeLookUpController>(
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
          child: GetBuilder<CustomerTypeLookUpController>(
            builder: (controller) => Row(
              children: [
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
                    controller.search();
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
