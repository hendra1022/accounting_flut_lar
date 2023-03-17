import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'component/item_create_table_builder.dart';
import 'item_create.dart';

class ItemCreatePage extends StatelessWidget {
  const ItemCreatePage({super.key});

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
          _header(),
          const SizedBox(
            height: marginSmall,
          ),
          Expanded(
            child: ListView(
              children: [
                _inputForm(),
                const SizedBox(height: marginExtraLarge),
                _variantForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
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
                      VNavigation().toDashboardPage();
                    },
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: VColor.white,
                  ),
                  VText(
                    "Item",
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
                    "Create",
                    fontSize: textSizeMedium,
                    color: VColor.black,
                  ),
                ],
              ),
              const SizedBox(
                height: marginSuperSmall,
              ),
              const VText(
                "Master Item Create",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Row(
            children: [
              GetBuilder<ItemCreateController>(
                builder: (controller) => VButton(
                  "Master Item Categryo Create",
                  buttonColor: VColor.secondary,
                  leftIcon: const Icon(
                    Icons.save,
                    color: VColor.white,
                  ),
                  onPressed: () async {
                    await controller.onSave();
                  },
                ),
              ),
              const SizedBox(width: marginMedium),
              VButton(
                "Cancel",
                buttonColor: VColor.white,
                textColor: VColor.black,
                leftIcon: const Icon(
                  Icons.close,
                  color: VColor.black,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _inputForm() {
    Widget inputField(TextEditingController controller, String title) {
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
                child: VInputText(
                  autoFocus: false,
                  hint: title,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  fillColor: VColor.white,
                  hintTextColor: VColor.grey1,
                  textEditingController: controller,
                  keyboardType: TextInputType.text,
                  textPadding: paddingSuperSmall,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "$title can't be empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPicker(String title, bool isVisible, TextEditingController controller, {void Function()? onPressed}) {
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: Expanded(
                        child: VInputText(
                          autoFocus: false,
                          textEditingController: controller,
                          readOnly: true,
                          filled: true,
                          fillColor: VColor.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: const SizedBox(
                        width: marginMedium,
                      ),
                    ),
                    VIconButton(
                      Icons.search,
                      colorBackground: VColor.secondary,
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget haveVariant() {
      return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: VText("Have Variant"),
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
                  child: GetBuilder<ItemCreateController>(
                    builder: (controller) => VCheckbox(
                      isChecked: controller.isHaveVariant,
                      onChanged: (value) {
                        controller.updateIsHaveVariant();
                      },
                    ),
                  ),
                ),
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
                  child: GetBuilder<ItemCreateController>(
                    builder: (controller) => VCheckbox(
                      isChecked: controller.isActive,
                      onChanged: (value) {
                        controller.updateIsActive();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GetBuilder<ItemCreateController>(
              builder: (controller) => Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputField(controller.nameTextController, "Name"),
                    const SizedBox(height: marginMedium),
                    Visibility(
                      visible: !controller.isHaveVariant,
                      child: Column(
                        children: [
                          inputField(controller.nameTextController, "Code"),
                          const SizedBox(height: marginMedium),
                          inputField(controller.hppTextController, "HPP"),
                          const SizedBox(height: marginMedium),
                        ],
                      ),
                    ),
                    inputPicker(
                      "Item Category",
                      controller.isCategoryPicked,
                      controller.categoryTextController,
                      onPressed: () {
                        controller.isCategoryPicked = !controller.isCategoryPicked;
                        controller.update();
                      },
                    ),
                    const SizedBox(height: marginMedium),
                    inputPicker(
                      "Customer Tax",
                      controller.isCustoemrTaxPicked,
                      controller.customerTaxTextController,
                      onPressed: () {
                        controller.isCustoemrTaxPicked = !controller.isCustoemrTaxPicked;
                        controller.update();
                      },
                    ),
                    const SizedBox(height: marginMedium),
                    inputPicker(
                      "Supplier Tax",
                      controller.isSupplierTaxPicked,
                      controller.supplierTaxTextController,
                      onPressed: () {
                        controller.isSupplierTaxPicked = !controller.isSupplierTaxPicked;
                        controller.update();
                      },
                    ),
                    const SizedBox(height: marginExtraLarge),
                    haveVariant(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: GetBuilder<ItemCreateController>(
              builder: (controller) => Visibility(
                visible: !controller.isHaveVariant,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const VText("Item Picture"),
                      const SizedBox(height: marginSmall),
                      SizedBox(
                        width: 150,
                        child: VButton(
                          "Browser",
                          leftIcon: const Icon(Icons.file_download),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: marginMedium,
                      ),
                      active(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _variantForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GetBuilder<ItemCreateController>(
          builder: (controller) => Align(
            alignment: Alignment.topRight,
            child: Visibility(
              visible: controller.isHaveVariant,
              child: SizedBox(
                width: 150,
                child: VButton(
                  "Add Variant",
                  leftIcon: const Icon(
                    Icons.add,
                    color: VColor.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: marginMedium,
        ),
        buildTableItem(),
      ],
    );
  }
}
