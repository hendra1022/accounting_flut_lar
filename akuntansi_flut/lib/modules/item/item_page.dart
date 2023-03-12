import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/modules/app_bar/custom_app_bar_widget.dart';
import 'package:akuntansi_flut/modules/item/component/item_table_builder.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';
import 'component/item_filter.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

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
              children: [
                itemFilter(),
                SizedBox(
                  height: marginSmall,
                ),
                buildTableItem(),
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
                    "Item",
                    fontSize: textSizeMedium,
                    color: VColor.white,
                  ),
                ],
              ),
              SizedBox(
                height: marginSuperSmall,
              ),
              VText(
                "Item",
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
                onPressed: () {
                  VNavigation().toItemCreatePage();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
