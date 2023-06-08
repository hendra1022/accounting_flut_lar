import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/thousand_seperator.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'sales_create.dart';
import 'table.dart';

class SalesCreatePage extends StatelessWidget {
  const SalesCreatePage({super.key});

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
          const _Header(),
          const SizedBox(height: marginSmall),
          Expanded(
            child: ListView(
              children: const [
                _InputForm(),
                Divider(
                  thickness: 2,
                  color: VColor.black,
                ),
                _SalesLineForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

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
                    "Sales",
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
                "Sales Create",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Row(
            children: [
              GetBuilder<SalesCreateController>(
                builder: (controller) => VButton(
                  "Save",
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
}

class _InputForm extends StatelessWidget {
  const _InputForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GetBuilder<SalesCreateController>(
              builder: (controller) => Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputPicker(
                      "Customer Name",
                      controller.customer.id == null ? false : true,
                      controller.customerTextController,
                      onPressed: () {
                        VNavigation().toCustomerLookUp(
                          callback: (p0) {
                            if (p0 != null) {
                              if (p0[PrefConst.keyArgsCustomer] != null) {
                                controller.customer = p0[PrefConst.keyArgsCustomer];
                                controller.customerTextController.text = controller.customer.name ?? "";
                                controller.update();
                              }
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(height: marginMedium),
                    transactionDate(),
                    const SizedBox(height: marginMedium),
                    inputField(controller.noteHeaderTextController, "Note")
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: GetBuilder<SalesCreateController>(
              builder: (controller) => const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Widget transactionDate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: marginMedium),
          child: VText("Transaction Date (Day-Month-Year)"),
        )),
        const SizedBox(
          width: marginMedium,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: marginMedium),
            child: GetBuilder<SalesCreateController>(
              builder: (controller) => GestureDetector(
                onTap: () => showDatePickerStartDate(controller),
                child: VText(
                  controller.transactionDateView,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showDatePickerStartDate(SalesCreateController controller) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: controller.transactionDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != controller.transactionDate) {
      controller.updateStartDate(picked);
    }
  }
}

class _SalesLineForm extends StatelessWidget {
  const _SalesLineForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const VText(
                "Sales Item",
                fontSize: textSizeLarge,
              ),
              VButton(
                "Add Item",
                leftIcon: const Icon(
                  Icons.add,
                  color: VColor.white,
                ),
                onPressed: () {
                  Get.find<SalesCreateController>().updateAddItemFormVisible();
                },
              )
            ],
          ),
          const SizedBox(
            height: marginMedium,
          ),
          GetBuilder<SalesCreateController>(
            builder: (controller) => Visibility(
              visible: controller.isAddItemFormShown,
              child: const _AddNewItemForm(),
            ),
          ),
          const SalesLineTable(),
        ],
      ),
    );
  }
}

class _AddNewItemForm extends StatelessWidget {
  const _AddNewItemForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      decoration: BoxDecoration(
        color: VColor.white,
        borderRadius: BorderRadius.circular(radiusExtraLarge),
      ),
      padding: const EdgeInsets.all(paddingMedium),
      margin: const EdgeInsets.only(bottom: marginMedium),
      child: GetBuilder<SalesCreateController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputPicker(
              "Item Name",
              controller.item.id == null ? false : true,
              controller.itemTextController,
              onPressed: () {
                VNavigation().toItemLookUp(
                  callback: (p0) {
                    if (p0 != null) {
                      if (p0[PrefConst.keyArgsItem] != null) {
                        controller.item = p0[PrefConst.keyArgsItem];
                        controller.itemTextController.text = controller.item.name ?? "";
                        controller.update();
                      }
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: marginSmall,
            ),
            inputPrice(),
            const SizedBox(
              height: marginSmall,
            ),
            inputQty(),
            const SizedBox(
              height: marginLarge,
            ),
            inputField(controller.noteLineTextController, "Note", number: false),
            const SizedBox(
              height: marginLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VButton(
                  "Close",
                  leftIcon: const Icon(
                    Icons.delete,
                    color: VColor.primary,
                  ),
                  textColor: VColor.primary,
                  buttonColor: VColor.grey1,
                  onPressed: () {
                    controller.updateAddItemFormVisible();
                  },
                ),
                const SizedBox(
                  width: marginMedium,
                ),
                VButton(
                  "Add",
                  leftIcon: const Icon(
                    Icons.add,
                    color: VColor.white,
                  ),
                  onPressed: () {
                    controller.onAddSalesLine();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String title, {bool number = true}) {
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
                keyboardType: number ? TextInputType.number : TextInputType.text,
                filledBorderColor: VColor.primary,
                textPadding: paddingSuperSmall,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "$title can't be empty";
                  } else if (int.tryParse(value) == null && number) {
                    return "Value must be number";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (number) {
                    if (value.isEmpty) {
                      controller.text = "0";
                    } else if (value[0] == "0" && value.length > 1) {
                      controller.text = controller.text.replaceFirst("0", "");
                      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
                    }
                  }
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

  Widget inputPrice() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: VText("Price"),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: GetBuilder<SalesCreateController>(
              builder: (controller) => SizedBox(
                width: double.infinity,
                child: VInputText(
                  autoFocus: false,
                  hint: "Price",
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  fillColor: VColor.white,
                  hintTextColor: VColor.grey1,
                  textEditingController: controller.priceTextController,
                  keyboardType: TextInputType.number,
                  filledBorderColor: VColor.primary,
                  textPadding: paddingSuperSmall,
                  textInputFormater: [ThousandsSeparatorInputFormatter()],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Price can't be empty";
                    } else if (int.tryParse(value.replaceAll(".", "")) == null) {
                      return "Price must be number";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.updatePrice(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputQty() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: VText("Quantity"),
          ),
          const SizedBox(
            width: marginMedium,
          ),
          Expanded(
            flex: 2,
            child: GetBuilder<SalesCreateController>(
              builder: (controller) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VIconButton(
                    Icons.add,
                    colorBackground: VColor.secondary,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: marginMedium,
                  ),
                  SizedBox(
                    width: 200,
                    child: VInputText(
                      autoFocus: false,
                      hint: "0",
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      filled: true,
                      fillColor: VColor.white,
                      hintTextColor: VColor.grey1,
                      textEditingController: controller.qtyTextController,
                      keyboardType: TextInputType.number,
                      filledBorderColor: VColor.primary,
                      textPadding: paddingSuperSmall,
                      textInputFormater: [ThousandsSeparatorInputFormatter()],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Quantity can't be empty";
                        } else if (int.tryParse(value.replaceAll(".", "")) == null) {
                          return "Quantity must be number";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.updateQuantity(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: marginMedium,
                  ),
                  VIconButton(
                    Icons.remove,
                    colorBackground: VColor.secondary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
