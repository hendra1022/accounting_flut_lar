import 'package:akuntansi_flut/modules/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/v_color.dart';
import 'component/app_bar.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  Widget _body() {
    return GetBuilder<NavigatorController>(
      builder: (controller) => Column(
        children: [
          appBar(controller),
          Expanded(
            child: controller.selectedPageWidget(),
          ),
        ],
      ),
    );
  }
}
