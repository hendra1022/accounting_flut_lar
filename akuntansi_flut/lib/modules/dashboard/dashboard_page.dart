import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';
import 'dashboard.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return GetBuilder<DashboardController>(
      builder: (controller) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingSmall),
        child: Column(
          children: [
            _header(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: EdgeInsets.all(paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VText(
            "Dashboard",
            fontSize: textSizeMedium,
            color: VColor.white,
          ),
          SizedBox(
            height: marginSuperSmall,
          ),
          VText(
            "Dashboard",
            fontSize: textSizeLarge,
            color: VColor.white,
          ),
        ],
      ),
    );
  }
}
