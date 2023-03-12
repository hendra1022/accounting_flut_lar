import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/v_color.dart';
import '../../../utils/widgets/v_widgets.dart';
import '../custom_app_bar.dart';

Widget transactionMenuDropDown() {
  return SizedBox(
    width: 150,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: GetBuilder<CustomAppBarController>(
            builder: (controller) => VButton(
              "Purchase",
              onPressed: () {
                VNavigation().toPurchasePage();
                controller.updateDropdownTransaction();
              },
              onHover: (p0) {
                controller.updateDropdownTransaction();
              },
              textPadding: marginExtraLarge,
              buttonColor: VColor.white,
              textColor: VColor.black,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: GetBuilder<CustomAppBarController>(
            builder: (controller) => VButton(
              "Sales",
              onPressed: () {
                VNavigation().toSalesPage();
                controller.updateDropdownTransaction();
              },
              onHover: (p0) {
                controller.updateDropdownTransaction();
              },
              textPadding: marginExtraLarge,
              buttonColor: VColor.white,
              textColor: VColor.black,
            ),
          ),
        )
      ],
    ),
  );
}
