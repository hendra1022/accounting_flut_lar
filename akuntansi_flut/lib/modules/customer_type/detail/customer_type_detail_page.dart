import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../commons/routes/app_navigation.dart';
import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'customer_type_detail.dart';

class CustomerTypeDetailPage extends StatelessWidget {
  const CustomerTypeDetailPage({super.key});

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
          GetBuilder<CustomerTypeDetailController>(
            builder: (controller) => controller.isLoading
                ? const VLoadingPage()
                : Expanded(
                    child: ListView(
                      children: const [
                        DetailItem(),
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
              GetBuilder<CustomerTypeDetailController>(
                builder: (controller) => VText(
                  "Customer Type Master - ${controller.customerType.name ?? '-'}",
                  fontSize: textSizeLarge,
                  color: VColor.white,
                ),
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
                  GetBuilder<CustomerTypeDetailController>(
                    builder: (controller) => VButton(
                      "Update",
                      buttonColor: VColor.secondary,
                      leftIcon: const Icon(
                        Icons.edit,
                        color: VColor.white,
                      ),
                      onPressed: () {
                        VNavigation().toCustomerTypeCreatePage(custTypeId: controller.customerType.id ?? 0);
                      },
                    ),
                  ),
                  const SizedBox(width: marginMedium),
                  GetBuilder<CustomerTypeDetailController>(
                    builder: (controller) => VButton(
                      "Delete",
                      buttonColor: VColor.red,
                      leftIcon: const Icon(
                        Icons.delete,
                        color: VColor.white,
                      ),
                      onPressed: () {
                        controller.deleteData();
                      },
                    ),
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerTypeDetailController>(
      builder: (controller) => controller.isLoading
          ? const VLoadingPage()
          : Container(
              padding: const EdgeInsets.all(paddingMedium),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        detailField("Name", controller.customerType.name ?? "-"),
                        const SizedBox(height: marginExtraLarge),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: marginExtraLarge,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        active(),
                      ],
                    ),
                  ),
                ],
              ),
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
                child: GetBuilder<CustomerTypeDetailController>(
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
}
