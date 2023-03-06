import 'package:akuntansi_flut/modules/navigator/navigator.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/v_color.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      backgroundColor: VColor.background,
    );
  }

  _body() {
    return GetBuilder<NavigatorController>(
      builder: (controller) => Row(
        children: [
          SideMenu(
            items: controller.sideMenuItems,
            controller: controller.pageController,
            style: SideMenuStyle(
              backgroundColor: VColor.secondary,
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children: [
                Container(
                  child: const Center(
                    child: Text('Dashboard'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('Settings'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('Settings'),
                  ),
                ),
                Container(
                  child: const Center(
                    child: Text('Settings'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
