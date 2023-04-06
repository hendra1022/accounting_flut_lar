import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'purchase_create.dart';
import 'table.dart';

class PurchaseCreatePage extends StatelessWidget {
  const PurchaseCreatePage({super.key});

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
          Expanded(
            child: ListView(
              children: const [
                InputForm(),
                Divider(
                  thickness: 2,
                  color: VColor.black,
                ),
                PurchaseLineForm(),
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
                  VText(
                    "Purchase",
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
                "Purchase Create",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Row(
            children: [
              GetBuilder<PurchaseCreateController>(
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

class InputForm extends StatelessWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GetBuilder<PurchaseCreateController>(
              builder: (controller) => Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputField(controller.codeTextController, "Document No"),
                    const SizedBox(height: marginMedium),
                    inputField(controller.nameTextController, "Supplier Name"),
                    const SizedBox(height: marginMedium),
                    transactionDate(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: marginExtraLarge,
          ),
          Expanded(
            child: GetBuilder<PurchaseCreateController>(
              builder: (controller) => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [],
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

  Widget transactionDate() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: marginMedium),
          child: VText("Transaction Date"),
        )),
        const SizedBox(
          width: marginMedium,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: marginMedium),
            child: GetBuilder<PurchaseCreateController>(
              builder: (controller) => GestureDetector(
                onTap: () => showDatePickerStartDate(controller),
                child: VText(
                  controller.startDateView,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showDatePickerStartDate(PurchaseCreateController controller) async {
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

class PurchaseLineForm extends StatelessWidget {
  const PurchaseLineForm({super.key});

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
                "Purchase Item",
                fontSize: textSizeLarge,
              ),
              VButton(
                "Create",
                leftIcon: const Icon(
                  Icons.add,
                  color: VColor.white,
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: marginMedium,
          ),
          const PurchaseLineTable(),
        ],
      ),
    );
  }
}
