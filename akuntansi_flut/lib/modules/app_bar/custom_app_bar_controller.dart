import '../../commons/base_controller.dart';
import '../../commons/routes/app_navigation.dart';

class CustomAppBarController extends BaseController {
  bool showDropdownMaster = false;
  bool showDropdownTransaction = false;

  void updateDropdownMaster() {
    showDropdownMaster = !showDropdownMaster;
    update();
  }

  void updateDropdownTransaction() {
    showDropdownTransaction = !showDropdownTransaction;
    update();
  }

  void doLogOut() {
    VNavigation().offAllToLoginPage();
  }
}
