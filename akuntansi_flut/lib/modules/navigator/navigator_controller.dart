import 'package:akuntansi_flut/utils/v_color.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '../../commons/base_controller.dart';

class NavigatorController extends BaseController {
  PageController pageController = PageController();

  List<SideMenuItem> sideMenuItems = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await initLocalData();
  }

  Future<void> initLocalData() async {
    sideMenuItems = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Dashboard',
        onTap: () => pageController.jumpToPage(0),
        icon: const Icon(Icons.home, color: VColor.primary),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Item',
        onTap: () => pageController.jumpToPage(1),
        icon: const Icon(Icons.settings, color: VColor.primary),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Settings',
        onTap: () => pageController.jumpToPage(2),
        icon: const Icon(Icons.settings, color: VColor.primary),
      ),
      SideMenuItem(
        priority: 3,
        title: 'Settings',
        onTap: () => pageController.jumpToPage(3),
        icon: const Icon(Icons.settings, color: VColor.primary),
      ),
      // SideMenuItem(
      //   priority: 2,
      //   title: 'Exit',
      //   onTap: () {},
      //   icon: const Icon(Icons.exit_to_app, color: VColor.primary),
      // ),
    ];
  }
}
