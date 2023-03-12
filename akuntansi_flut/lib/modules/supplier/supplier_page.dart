import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';
import '../app_bar/custom_app_bar.dart';

class SupplierPage extends StatelessWidget {
  const SupplierPage({super.key});

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
      padding: EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: marginSmall,
          ),
          Expanded(
            child: ListView(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: EdgeInsets.all(paddingMedium),
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
                  ),
                ],
              ),
              SizedBox(
                height: marginSuperSmall,
              ),
              VText(
                "Sales",
                fontSize: textSizeLarge,
                color: VColor.white,
              ),
            ],
          ),
          Column(
            children: [
              VButton(
                "CREATE",
                buttonColor: VColor.secondary,
                leftIcon: const Icon(
                  Icons.add,
                  color: VColor.white,
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
