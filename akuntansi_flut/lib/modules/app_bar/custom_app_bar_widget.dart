import 'package:akuntansi_flut/modules/app_bar/custom_app_bar.dart';
import 'package:akuntansi_flut/modules/app_bar/drop_down/master_menu.dart';
import 'package:akuntansi_flut/modules/app_bar/drop_down/transaction_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';

AppBar customAppBar() {
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
            child: GetBuilder<CustomAppBarController>(
              builder: (controller) => PortalTarget(
                visible: controller.showDropdownMaster,
                anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
                portalFollower: Material(
                  elevation: 8,
                  child: IntrinsicWidth(child: masterMenuDropDown()),
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
        ),
        SizedBox(
          height: 50,
          child: Center(
            child: GetBuilder<CustomAppBarController>(
              builder: (controller) => PortalTarget(
                visible: controller.showDropdownTransaction,
                anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
                portalFollower: Material(
                  elevation: 8,
                  child: IntrinsicWidth(child: transactionMenuDropDown()),
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
        ),
      ],
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: marginMedium),
        height: 50,
        child: Center(
          child: GetBuilder<CustomAppBarController>(
            builder: (controller) => VButton(
              "Log Out",
              onPressed: () {
                controller.doLogOut();
              },
              textColor: VColor.black,
              buttonColor: VColor.white,
            ),
          ),
        ),
      ),
    ],
    backgroundColor: VColor.white,
  );
}
