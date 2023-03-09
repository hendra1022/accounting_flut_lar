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
              "Purchasing",
              onPressed: () {},
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
              onPressed: () {},
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
