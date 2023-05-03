import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../../app_bar/custom_app_bar.dart';
import 'item_detail.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

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
          GetBuilder<ItemDetailController>(
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
                    "Item",
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
              GetBuilder<ItemDetailController>(
                builder: (controller) => VText(
                  "Master Item View - ${controller.item.name ?? '-'}",
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
                  VButton(
                    "Update",
                    buttonColor: VColor.secondary,
                    leftIcon: const Icon(
                      Icons.edit,
                      color: VColor.white,
                    ),
                    onPressed: () {
                      VNavigation().toItemCreatePage(itemId: Get.find<ItemDetailController>().itemId);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingMedium),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<ItemDetailController>(
            builder: (controller) => Expanded(
              child: Column(
                children: [
                  detailField("Name", controller.item.name ?? "-"),
                  const SizedBox(height: marginExtraLarge),
                  detailField("Item Category", controller.item.icName ?? "-"),
                  const SizedBox(height: marginExtraLarge),
                  // haveVariant(),
                  // const SizedBox(height: marginExtraLarge),
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
              children: [
                const VText("Item Picture"),
                const SizedBox(height: marginExtraLarge),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const Center(child: VText("Item Image")),
                ),
                const SizedBox(height: marginExtraLarge),
                active(),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                child: GetBuilder<ItemDetailController>(
                  builder: (controller) => VCheckbox(
                    isChecked: controller.isHaveVariant,
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
                child: GetBuilder<ItemDetailController>(
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
