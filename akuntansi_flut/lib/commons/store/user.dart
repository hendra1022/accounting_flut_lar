import 'package:akuntansi_flut/commons/store/store.dart';
import 'package:akuntansi_flut/utils/constants.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  bool isLogin = false;

  @override
  void onInit() {
    super.onInit();
    updateStatusLogin();
  }

  void updateStatusLogin() {
    isLogin = StorageService.to.getBool(PrefConst.keyIsLogin) ?? false;
  }

  void setStatusLogin(bool isLogin) {
    StorageService.to.setBool(PrefConst.keyIsLogin, isLogin);
  }

  bool getStatusLogin() {
    return isLogin;
  }
}
