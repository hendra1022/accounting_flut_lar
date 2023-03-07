import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../navigator.dart';

Widget appBar(NavigatorController controller) {
  return AppBar(
    leading: Padding(
      padding: EdgeInsets.all(marginMedium),
      child: const Icon(
        Icons.home,
        color: VColor.black,
      ),
    ),
    leadingWidth: 20,
    title: Row(
      children: [
        SizedBox(
          width: marginMedium,
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: PortalTarget(
              visible: controller.showDropdownMaster,
              anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
              portalFollower: Material(
                elevation: 8,
                child: IntrinsicWidth(child: dropdownMenuMaster(controller)),
              ),
              child: VButton(
                "Master",
                onPressed: () {},
                onHover: (p0) async {
                  controller.updateDropdownMaster();
                },
                buttonColor: VColor.white,
                textColor: VColor.black,
                rightIcon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: VColor.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: PortalTarget(
              visible: controller.showDropdownTransaction,
              anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
              portalFollower: Material(
                elevation: 8,
                child: IntrinsicWidth(child: dropdownMenuTransaction(controller)),
              ),
              child: VButton(
                "Transaction",
                onPressed: () {},
                onHover: (p0) async {
                  controller.updateDropdownTransaction();
                },
                buttonColor: VColor.white,
                textColor: VColor.black,
                rightIcon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: VColor.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: marginMedium),
        height: 50,
        child: Center(
          child: VButton(
            "Log Out",
            onPressed: () {},
            textColor: VColor.black,
            buttonColor: VColor.white,
          ),
        ),
      ),
    ],
    backgroundColor: VColor.white,
  );
}

Widget dropdownMenuMaster(NavigatorController controller) {
  return SizedBox(
    width: 150,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Item",
            onPressed: () => controller.updateSelectedPage(1),
            onHover: (p0) {
              controller.updateDropdownMaster();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Item Category",
            onPressed: () => controller.updateSelectedPage(2),
            onHover: (p0) {
              controller.updateDropdownMaster();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Supplier",
            onPressed: () => controller.updateSelectedPage(3),
            onHover: (p0) {
              controller.updateDropdownMaster();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Customer",
            onPressed: () => controller.updateSelectedPage(4),
            onHover: (p0) {
              controller.updateDropdownMaster();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        ),
      ],
    ),
  );
}

Widget dropdownMenuTransaction(NavigatorController controller) {
  return SizedBox(
    width: 110,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Purchasing",
            onPressed: () {},
            onHover: (p0) {
              controller.updateDropdownTransaction();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: VButton(
            "Sales",
            onPressed: () {},
            onHover: (p0) {
              controller.updateDropdownTransaction();
            },
            buttonColor: VColor.white,
            textColor: VColor.black,
          ),
        )
      ],
    ),
  );
}
