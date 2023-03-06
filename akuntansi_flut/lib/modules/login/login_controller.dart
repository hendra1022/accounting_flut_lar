import 'package:akuntansi_flut/commons/routes/app_navigation.dart';
import 'package:akuntansi_flut/utils/widgets/v_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../commons/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<void> doLogin() async {
    VPopup().loading();
    // await Future.delayed(const Duration(seconds: 2));
    Get.back();
    VNavigation().offAllToNavigatorPage();
  }
}
