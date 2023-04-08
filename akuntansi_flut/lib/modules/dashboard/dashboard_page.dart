import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/v_color.dart';
import '../../utils/widgets/v_widgets.dart';
import '../app_bar/custom_app_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      appBar: customAppBar(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingSmall),
      child: Column(
        children: [
          _header(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: VColor.primary, borderRadius: BorderRadius.all(Radius.circular(radiusMedium))),
      padding: const EdgeInsets.all(paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              VText(
                "Dashboard",
                fontSize: textSizeMedium,
                color: VColor.white,
              ),
              Icon(
                Icons.arrow_right,
                color: VColor.primary,
              )
            ],
          ),
          const SizedBox(
            height: marginSuperSmall,
          ),
          const VText(
            "Dashboard",
            fontSize: textSizeLarge,
            color: VColor.white,
          ),
        ],
      ),
    );
  }
}
